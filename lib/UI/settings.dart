import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/auth/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(LoginPage(
        onLogin: () {},
      ));
      SharedPreferences localStorage = await _prefs;
      await localStorage.remove('login');
    } catch (e) {
      print(e.toString());
    }
  }

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
        title: const Text("Pengaturan",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff0d163c),
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.white,
        elevation: 2,
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
                              Icon(Icons.person,
                                  size: 20, color: Color(0xff0d163c)),
                              SizedBox(width: 20),
                              Text("Informasi pribadi",
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
                              Icon(Icons.description,
                                  size: 20, color: Color(0xff0d163c)),
                              SizedBox(width: 20),
                              Text("Kebijakan privasi",
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
                              Icon(Icons.person_remove,
                                  size: 20, color: Color(0xff0d163c)),
                              SizedBox(width: 20),
                              Text("Hapus akun",
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
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 228, 228, 228))),
                        onPressed: () => _signOut(),
                        child: const Text("Keluar",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 94, 94, 94)))),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
