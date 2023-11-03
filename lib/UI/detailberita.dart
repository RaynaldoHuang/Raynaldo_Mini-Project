import 'package:flutter/material.dart';
import 'package:miniproject/firebase_berita/model/model.dart';

class DetailBeritaPage extends StatelessWidget {
  final News news;

  DetailBeritaPage({required this.news});

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.image),
            const SizedBox(height: 16),
            Text(
              news.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              news.content,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
