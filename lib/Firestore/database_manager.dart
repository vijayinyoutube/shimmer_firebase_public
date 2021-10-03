import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase {
  List studentsList = [];
  final Query<Map<String, dynamic>> collectionRef =
      FirebaseFirestore.instance.collection("Students").orderBy("Name");

  Future getData() async {
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          studentsList.add(result.data());
        }
      });

      return studentsList;
    } catch (e) {
      debugPrint("Error - $e");
      return e;
    }
  }
}
