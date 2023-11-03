import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miniproject/firebase_berita/model/model.dart';

class NewsViewModel {
  final CollectionReference _newsCollection =
      FirebaseFirestore.instance.collection('news');

  Stream<List<News>> getNews() {
    return _newsCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return News(
          image: data['image'],
          title: data['title'],
          content: data['content'],
        );
      }).toList();
    });
  }
}
