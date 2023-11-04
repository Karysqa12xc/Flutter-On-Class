import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/models/phone_number.dart';

class FireStorageService {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection("user");
  Future createPhoneNumber(PhoneNumber phoneNumber) async {
    try {
      await _userCollectionReference
          .doc(phoneNumber.phone)
          .set(phoneNumber.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
