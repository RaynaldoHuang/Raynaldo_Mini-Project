import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/UI/detail.dart';
import 'package:miniproject/firebase_berita/controller/viewmodel.dart';

// ignore: must_be_immutable
class SellPage extends StatelessWidget {
  SellPage({super.key});
  List listmobil = [
    {"id": 1, "image_path": "assets/1.jpg"},
    {"id": 2, "image_path": "assets/2.jpg"},
    {"id": 3, "image_path": "assets/3.jpg"},
    {"id": 4, "image_path": "assets/4.jpg"},
  ];

  final CarouselController carouselController = CarouselController();

  RxInt currentIndex = 0.obs;
  RxInt currentIndexmobil = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        title: Row(
          children: [
            Expanded(
                child: TextField(
                    decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                size: 28,
                color: Colors.black,
              ),
              hintText: "Cari merek, model & kata kunci",
              hintStyle:
                  const TextStyle(fontSize: 14, color: Color(0xff898989)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffB5B5B5), width: 0.5),
                  borderRadius: BorderRadius.circular(50)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffB5B5B5), width: 0.5),
                  borderRadius: BorderRadius.circular(50)),
              filled: true,
              fillColor: const Color(0xffF5F5F5),
              contentPadding: const EdgeInsets.all(12),
              isDense: true,
            ))),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.to(DetailMobil()),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CarouselSlider(
                            items: listmobil
                                .map((item) => Image.asset(
                                      item["image_path"],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ))
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              scrollPhysics: const BouncingScrollPhysics(),
                              autoPlay: false,
                              aspectRatio: 1.8,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                currentIndexmobil.value = index;
                                // setState(() {
                                //   currentIndexmobil = index;
                                // });
                              },
                            )),
                        Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: listmobil.asMap().entries.map((entry) {
                                // ignore: avoid_print
                                print(entry);
                                // ignore: avoid_print
                                print(entry.key);
                                return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Obx(
                                      () => Container(
                                        width:
                                            // ignore: unrelated_type_equality_checks
                                            currentIndexmobil == entry.key
                                                ? 17
                                                : 7,
                                        height: 7,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            // ignore: unrelated_type_equality_checks
                                            color:
                                                currentIndexmobil == entry.key
                                                    ? const Color(0xff0d163c)
                                                    : Colors.white),
                                      ),
                                    ));
                              }).toList(),
                            ))
                      ],
                    ),
                    const ListTile(
                      title: Text("2018 Honda BR-V PRESTIGE 1.5",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff0d163c),
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("85.600 | Automatic | Bekasi"),
                      trailing: Icon(Icons.favorite_border),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Rp.181.000.000",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ))),
                          SizedBox(height: 10),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Rp.181.000.000 (Cash)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
