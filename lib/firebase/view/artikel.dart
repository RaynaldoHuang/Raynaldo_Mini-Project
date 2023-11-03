import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject/UI/detailberita.dart';
import 'package:miniproject/firebase/controller/viewmodel.dart';
import 'package:miniproject/firebase/model/model.dart';

class ArtikelPage extends StatelessWidget {
  ArtikelPage({super.key});

  final NewsViewModel _viewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: const Text("Artikel",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff0d163c),
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: StreamBuilder(
        stream: _viewModel.getNews(),
        builder: (context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var newsList = snapshot.data;

          return ListView.builder(
            itemCount: newsList!.length,
            itemBuilder: (context, index) {
              var news = newsList[index];
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => Get.to(DetailBeritaPage(news: news)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(news.image),
                                        fit: BoxFit.cover),
                                    color: Colors.amber,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4))),
                                width: 130,
                                height: 80,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 230,
                                      child: Text(news.title,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  const Text("09:03AM • Herdi",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
