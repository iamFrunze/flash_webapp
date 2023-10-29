import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:uuid/uuid.dart';

class AdminProvider extends ChangeNotifier {
  AdminProvider() {
    FirebaseDatabase.instance.ref().child("admins").onValue.listen((snapshot) {
      admins.clear();

      Map<dynamic, dynamic> adminParse =
          snapshot.snapshot.value as Map<dynamic, dynamic>;

      adminParse.forEach((key, value) {
        String userId = key.toString();
        String name = value["name"].toString();

        final person = PersonModel(
          name: name,
          uuid: userId,
        );
        admins.add(person);

        notifyListeners();
      });
    });
  }

  final List<PersonModel> admins = [];
  final TextEditingController adminController = TextEditingController();
  final database = FirebaseDatabase.instance.ref("admins");

  final uuid = const Uuid();

  Future<void> addAdmin(String name) async {
    final person = PersonModel(name: name, uuid: uuid.v1());
    admins.add(person);
    await _setToDB(person);
    adminController.clear();
    notifyListeners();
  }

  Future<void> _setToDB(PersonModel person) async {
    database.child(person.uuid).set({
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
