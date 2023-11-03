import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/UI/detail.dart';
import 'package:miniproject/UI/profile.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  List imageList = [
    {"id": 1, "image_path": "assets/promo1.jpg"},
    {"id": 2, "image_path": "assets/promo2.jpg"},
    {"id": 3, "image_path": "assets/promo3.jpg"},
  ];

  List listmobil = [
    {"id": 1, "image_path": "assets/1.jpg"},
    {"id": 2, "image_path": "assets/2.jpg"},
    {"id": 3, "image_path": "assets/3.jpg"},
    {"id": 4, "image_path": "assets/4.jpg"},
  ];

  final CarouselController carouselController = CarouselController();
  // ignore: unused_field
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  RxInt currentIndex = 0.obs;
  RxInt currentIndexmobil = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            const SizedBox(width: 10),
            IconButton(
                padding: EdgeInsetsDirectional.zero,
                onPressed: () => Get.to(const ProfilePage()),
                icon: const Icon(Icons.account_circle,
                    color: Color(0xff0d163c), size: 48))
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                    items: imageList
                        .map((item) => Image.asset(
                              item["image_path"],
                              width: double.infinity,
                            ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 3,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        currentIndex.value = index;
                      },
                    )),
                Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        // ignore: avoid_print
                        print(entry);
                        // ignore: avoid_print
                        print(entry.key);
                        return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Obx(
                              () => Container(
                                // ignore: unrelated_type_equality_checks
                                width: currentIndex == entry.key ? 17 : 7,
                                height: 7,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // ignore: unrelated_type_equality_checks
                                    color: currentIndex == entry.key
                                        ? const Color(0xff0d163c)
                                        : Colors.white),
                              ),
                            ));
                      }).toList(),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Rekomendasi buat kamu",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        onTap: () {
                          controller.currentIndex.value = 1;
                        },
                        child: const Text("Semua",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
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
                                    children:
                                        listmobil.asMap().entries.map((entry) {
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 3),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  // ignore: unrelated_type_equality_checks
                                                  color: currentIndexmobil ==
                                                          entry.key
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
                            padding: EdgeInsets.only(
                                right: 16, left: 16, bottom: 16),
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
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff0d163c))),
                        onPressed: () {
                          controller.currentIndex.value = 1;
                        },
                        child: const Text("Tampilkan Semua Mobil",
                            style: TextStyle(fontSize: 16))),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Artikel Terbaru",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        onTap: () {
                          controller.currentIndex.value = 2;
                        },
                        child: const Text("Semua",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/1.jpg"),
                                  fit: BoxFit.cover),
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          width: 130,
                          height: 80,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const SizedBox(
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 230,
                                child: Text(
                                    "Dealer Ford di indonesia bakal kembali makin banyak",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ))),
                            Text("09:03AM • Herdi",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomNavBarController extends GetxController {
  final RxInt currentIndex = 0.obs;
}
