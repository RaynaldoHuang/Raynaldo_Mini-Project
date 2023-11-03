import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// ignore: must_be_immutable
class CarRecommendationView extends StatefulWidget {
  const CarRecommendationView({super.key});

  @override
  State<CarRecommendationView> createState() => _CarRecommendationViewState();
}

class _CarRecommendationViewState extends State<CarRecommendationView> {
  late final TextEditingController promptController;
  String responseTxt = "";
  late ResponseModel _responseModel;

  @override
  void initState() {
    promptController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff343541),
      appBar: AppBar(
        title: const Text("Tanyakan Masalahmu Disini"),
        backgroundColor: const Color(0xff343541),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PromptBldr(responseTxt: responseTxt),
            ListView(
              shrinkWrap: true,
              children: [
                TextFormFieldBldr(
                    promptController: promptController, btnFun: completionFun),
              ],
            )
          ],
        ),
      ),
    );
  }

  completionFun() async {
    setState(() => responseTxt = "Loading...");
    final response =
        await http.post(Uri.parse("https://api.openai.com/v1/completions"),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': "Bearer ${dotenv.env['token']}"
            },
            body: jsonEncode({
              "model": "text-davinci-003",
              "prompt": promptController.text,
              "max_tokens": 250,
              "temperature": 0,
              "top_p": 1
            }));

    print(response.body);

    setState(() {
      _responseModel = ResponseModel.fromJson(json.decode(response.body));
      responseTxt = _responseModel.choices[0]['text'];
      debugPrint(responseTxt);
    });
  }
}

class ResponseModel {
  final List<Map<String, dynamic>> choices;

  ResponseModel({required this.choices});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    var choicesList = json['choices'] as List;
    List<Map<String, dynamic>> choices =
        choicesList.map((choice) => choice as Map<String, dynamic>).toList();

    return ResponseModel(choices: choices);
  }
}

class PromptBldr extends StatelessWidget {
  const PromptBldr({super.key, required this.responseTxt});

  final String responseTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 1.35,
      color: const Color(0xff434654),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Text(
              responseTxt,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldBldr extends StatelessWidget {
  const TextFormFieldBldr(
      {super.key, required this.promptController, required this.btnFun});

  final TextEditingController promptController;
  final Function btnFun;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(
          children: [
            Flexible(
                child: TextFormField(
              cursorColor: Colors.white,
              controller: promptController,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff444653),
                      ),
                      borderRadius: BorderRadius.circular(5.5)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff444653))),
                  filled: true,
                  fillColor: const Color(0xff444653),
                  hintText: "Inputkan ciri-ciri mobil yang diinginkan",
                  hintStyle: const TextStyle(color: Colors.grey)),
            )),
            Container(
              color: const Color(0xff19bc99),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                    onPressed: () => btnFun(),
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
