import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/firebase/view/artikel.dart';
import 'package:miniproject/UI/home/homepage.dart';
import 'package:miniproject/UI/sellpage.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController controller = Get.put(BottomNavBarController());

    void onBarTapped(int index) {
      controller.currentIndex.value = index;
    }

    return Scaffold(
        body: Obx(() => _buildBody(controller.currentIndex.value)),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedFontSize: 14,
            unselectedFontSize: 14,
            currentIndex: controller.currentIndex.value,
            onTap: onBarTapped,
            selectedItemColor: const Color(0xff0d163c),
            unselectedItemColor: const Color.fromARGB(255, 157, 157, 157),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Beranda'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.directions_car), label: 'Beli Mobil'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: 'Artikel'),
            ],
          ),
        ));
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return SellPage();
      case 2:
        return ArtikelPage();
      default:
        return HomePage(); // Halaman beranda sebagai halaman default
    }
  }
}
