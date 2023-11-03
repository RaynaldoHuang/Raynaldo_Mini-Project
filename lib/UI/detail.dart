import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/UI/settings.dart';
import 'package:miniproject/openAI/chatgpt.dart';

// ignore: must_be_immutable
class DetailMobil extends StatelessWidget {
  DetailMobil({super.key});
  RxInt currentIndexmobil = 0.obs;
  List listmobil = [
    {"id": 1, "image_path": "assets/1.jpg"},
    {"id": 2, "image_path": "assets/2.jpg"},
    {"id": 3, "image_path": "assets/3.jpg"},
    {"id": 4, "image_path": "assets/4.jpg"},
  ];

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          titleSpacing: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios,
                  color: Color(0xff0d163c), size: 20)),
          backgroundColor: Colors.white,
          elevation: 2,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Get.to(SettingsPage()),
                    icon: const Icon(Icons.favorite_outline,
                        color: Color(0xff0d163c), size: 24)),
                IconButton(
                    onPressed: () => Get.to(SettingsPage()),
                    icon: const Icon(Icons.share,
                        color: Color(0xff0d163c), size: 24)),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              onTap: () =>
                                  carouselController.animateToPage(entry.key),
                              child: Obx(
                                () => Container(
                                  width:
                                      // ignore: unrelated_type_equality_checks
                                      currentIndexmobil == entry.key ? 17 : 7,
                                  height: 7,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // ignore: unrelated_type_equality_checks
                                      color: currentIndexmobil == entry.key
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
                      fontSize: 20,
                      color: Color(0xff0d163c),
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text("85.600 | Automatic | Bekasi"),
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
              ),
              Container(
                width: double.infinity,
                height: 10,
                color: const Color.fromARGB(255, 234, 234, 234),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Detail Mobil",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff0d163c),
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text("Jenis Bahan Bakar",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff0d163c),
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Bensin"),
                    ),
                    ListTile(
                      title: Text("Warna",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff0d163c),
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Putih"),
                    ),
                    ListTile(
                      title: Text("Jumlah Tempat Duduk",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff0d163c),
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("4"),
                    ),
                    ListTile(
                      title: Text("Masa Berlaku STNK",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff0d163c),
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("Agustus 2022"),
                    ),
                    ListTile(
                      title: Text("Jarak Tempuh Saat Ini",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff0d163c),
                            fontWeight: FontWeight.bold,
                          )),
                      subtitle: Text("38.000 Km"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 84,
          // color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xff0d163c),
                            shape: const StadiumBorder(),
                            side: const BorderSide(color: Color(0xff0d163c)),
                            minimumSize: const Size(160, 50),
                            elevation: 0,
                            shadowColor: Colors.white),
                        child: const Text("Pesan Mobil",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () => Get.to(CarRecommendationView()),
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xff0d163c),
                              minimumSize: const Size(160, 50),
                              elevation: 0,
                              shadowColor: Colors.white),
                          child: const Text("Tanyak AI",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600))),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
