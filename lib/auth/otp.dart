import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/bottomnavbar/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class OtpPage extends StatelessWidget {
  final String verificationId;
  final bool _timerHasExpired = false;
  final TextEditingController _otpController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  OtpPage(this.verificationId, {super.key});

  Future<void> _signInWithPhoneNumber(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.off(const BottomNavBar());
      SharedPreferences localStorage = await _prefs;
      await localStorage.setString('login', "1");
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.white,
          title: const Image(
            image: AssetImage("assets/GIF1.gif"),
            width: 120,
          ),
          elevation: 1,
          leading: IconButton(
              padding: EdgeInsetsDirectional.zero,
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios,
                  color: Color(0xff0d163c), size: 20))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Konfirmasi Nomor Telepon",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 4),
              const Text(
                "Masukkan kode OTP yang kami kirimkan melalui sms.",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Kode OTP",
                  style: TextStyle(fontSize: 16, color: Color(0xff0d163c)),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLength: 6,
                controller: _otpController,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0d163c))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0d163c))),
                    hintText: "Masukkan kode OTP",
                    prefixStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff0d163c))),
                    onPressed: () =>
                        _signInWithPhoneNumber(_otpController.text),
                    child: const Text("Verifikasi",
                        style: TextStyle(fontSize: 16))),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Text(
                      _timerHasExpired
                          ? 'Waktu habis. Silakan minta ulang kode.'
                          : 'Masukkan kode OTP',
                      style: TextStyle(fontSize: 16, color: Color(0xff0d163c)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
