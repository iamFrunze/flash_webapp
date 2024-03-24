import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../data/person_model.dart';

class AdminProvider extends ChangeNotifier {
  AdminProvider() {
    FirebaseDatabase.instance.ref().child("admins").onValue.listen((snapshot) {
      admins.clear();

      if (snapshot.snapshot.exists) {
        Map<dynamic, dynamic> adminParse =
            snapshot.snapshot.value as Map<dynamic, dynamic>;

        adminParse.forEach((key, value) {
          String userId = key.toString();
          String name = value["name"].toString();
          print('uder : $name');
          final person = PersonModel(
            name: name,
            uuid: userId,
          );
          admins.add(person);
          isExists = true;
          notifyListeners();
        });
      } else {
        isExists = false;
      }
    });
    isExists = false;
  }

  bool? isExists;
  final List<PersonModel> admins = [];
  final TextEditingController adminController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final database = FirebaseDatabase.instance.ref().child("admins");
  bool authEnable = true;

  final uuid = const Uuid();

  Future<void> addAdmin(String name) async {
    final person = PersonModel(name: name, uuid: uuid.v1());
    admins.add(person);
    await _setToDB(person);
    adminController.clear();
    notifyListeners();
  }

  Future<bool> auth() async {
    authEnable = false;
    notifyListeners();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginController.text,
        password: passwordController.text,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint('excp $e');
      authEnable = true;
      notifyListeners();
      return false;
    }

  }

  Future<void> _setToDB(PersonModel person) async {
    await database.child(person.uuid).set({
      "uuid": person.uuid,
      "name": person.name,
      "teachers": [],
    });
  }

  void onRemove(PersonModel personModel) {
    admins.remove(personModel);
    database.child(personModel.uuid).remove();
    adminController.clear();
    notifyListeners();
  }
}
