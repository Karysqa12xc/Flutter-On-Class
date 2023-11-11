import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/models/phone_number.dart';

class FireStorageService {
  final CollectionReference _phonesCollectionReference =
      FirebaseFirestore.instance.collection("phoneNumber");
  Future createPhoneNumber(PhoneNumber phoneNumber) async {
    try {
      await _phonesCollectionReference
          .doc('test')
          .set(phoneNumber.toJson());
      print("Added data successfully!");
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
