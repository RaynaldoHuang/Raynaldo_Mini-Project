import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miniproject/firebase_mobil/model/model.dart';

class CarsViewModel {
  final CollectionReference _carsCollection =
      FirebaseFirestore.instance.collection('cars');

  Stream<List<Cars>> getCars() {
    return _carsCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return Cars(
          descriptionsubtitle: data['descriptionsubtitle'],
          descriptiontitle: data['descriptiontitle'],
        );
      }).toList();
    });
  }
}
