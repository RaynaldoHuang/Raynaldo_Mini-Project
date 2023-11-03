import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/UI/settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        title: const Text("Akun Saya",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff0d163c),
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () => Get.to(SettingsPage()),
              icon: const Icon(Icons.settings,
                  color: Color(0xff0d163c), size: 20)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.directions_car,
                                  size: 20, color: Color(0xff0d163c)),
                              SizedBox(width: 20),
                              Text("Pesanan saya",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff0d163c),
                                  )),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 20, color: Color(0xff0d163c))
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite,
                                  size: 20, color: Color(0xff0d163c)),
                              SizedBox(width: 20),
                              Text("Favorit saya",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff0d163c),
                                  )),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 20, color: Color(0xff0d163c))
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.help,
                                  size: 20, color: Color(0xff0d163c)),
                              SizedBox(width: 20),
                              Text("FAQ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff0d163c),
                                  )),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 20, color: Color(0xff0d163c))
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.phone,
                                  size: 20, color: Color(0xff0d163c)),
                              SizedBox(width: 20),
                              Text("Hubungi kami",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff0d163c),
                                  )),
                            ],
                          ),
                          Text("021-4324-2323",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff0d163c),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16),
                //   child: SizedBox(
                //     width: double.infinity,
                //     height: 50,
                //     child: ElevatedButton(
                //         style: ButtonStyle(
                //             backgroundColor: MaterialStateProperty.all(
                //                 const Color(0xff0d163c))),
                //         onPressed: () => Get.off(LoginPage()),
                //         child: const Text("Masuk",
                //             style: TextStyle(fontSize: 16))),
                //   ),
                // ),
              ],
            )),
      ),
    );
  }
}
