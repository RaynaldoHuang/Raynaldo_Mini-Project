import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/auth/otp.dart';
import 'package:miniproject/bottomnavbar/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required Null Function() onLogin});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();

  Future<void> verifyPhoneNumber(BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+62${_phoneNumberController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('phoneNumber', _phoneNumberController.text);
        Get.off(const BottomNavBar());
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.off(OtpPage(verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
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
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    "Selamat Datang di",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Silahkan login dengan nomor telepon Anda",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Nomor Handphone",
                      style: TextStyle(fontSize: 16, color: Color(0xff0d163c)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneNumberController,
                    maxLength: 15,
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        counterText: "",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0d163c))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0d163c))),
                        hintText: "ex. 08123456789",
                        // prefixText: "+62 ",
                        prefixStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff0d163c))),
                        onPressed: () => verifyPhoneNumber(context),
                        child: const Text("Lanjutkan",
                            style: TextStyle(fontSize: 16))),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      text: 'Dengan ini, saya setuju dengan ',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'Ketentuan ',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: 'dan ',
                        ),
                        TextSpan(
                          text: 'Kebijakan Privasi',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
