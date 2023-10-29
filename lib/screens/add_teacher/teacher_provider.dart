import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:uuid/uuid.dart';

class TeacherProvider extends ChangeNotifier {
  final uuid = const Uuid();
  final List<PersonModel> teachers = [];
  late final PersonModel? _admin;
  final TextEditingController teacherController = TextEditingController();
  final database = FirebaseDatabase.instance.ref("admins");

  void init(PersonModel admin) {
    _admin = admin;

    FirebaseDatabase.instance
        .ref()
        .child("admins")
        .child(admin.uuid)
        .child('teachers')
        .onValue
        .listen((snapshot) {
      teachers.clear();

      if (snapshot.snapshot.exists) {
        Map<dynamic, dynamic> teachersParse =
            snapshot.snapshot.value as Map<dynamic, dynamic>;
        teachersParse.forEach((key, value) {
          final userId = '$key';
          final name = '${value["name"]}';
          final person = PersonModel(
            name: name,
            uuid: userId,
          );
          teachers.add(person);

          notifyListeners();
        });
      }
    });
  }

  Future<void> addTeacher(String name) async {
    final person = PersonModel(name: name, uuid: uuid.v1());
    teachers.add(person);
    await _setToDB(person);
    teacherController.clear();
    notifyListeners();
  }

  Future<void> _setToDB(PersonModel person) async {
    if (_admin != null) {
      database.child(_admin!.uuid).child('teachers').child(person.uuid).set({
        "uuid": person.uuid,
        "name": person.name,
      });
    }
  }

  void onRemove(PersonModel personModel) {
    teachers.remove(personModel);
    if (_admin != null) {
      database
          .child(_admin!.uuid)
          .child('teachers')
          .child(personModel.uuid)
          .remove();
    }

    teacherController.clear();
    notifyListeners();
  }
}
