import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:uuid/uuid.dart';

class StudentProvider extends ChangeNotifier {
  final uuid = const Uuid();
  final List<PersonModel> students = [];
  final TextEditingController studentController = TextEditingController();
  late final PersonModel? _teacher;
  late final PersonModel? _admin;
  final database = FirebaseDatabase.instance.ref("admins");

  void init(PersonModel admin, PersonModel teacher) {
    _teacher = teacher;
    _admin = admin;

    database
        .child(admin.uuid)
        .child('teachers')
        .child(teacher.uuid)
        .child('students')
        .onValue
        .listen((snapshot) {
      students.clear();

      if (snapshot.snapshot.exists) {
        Map<dynamic, dynamic> studentParse =
            snapshot.snapshot.value as Map<dynamic, dynamic>;
        studentParse.forEach((key, value) {
          final userId = '$key';
          final name = '${value["name"]}';
          final person = PersonModel(
            name: name,
            uuid: userId,
          );
          students.add(person);

          notifyListeners();
        });
      }
    });
  }

  Future<void> addStudent(String name) async {
    final person = PersonModel(name: name, uuid: uuid.v1());

    students.add(person);
    await _setToDB(person);
    studentController.clear();
    notifyListeners();
  }

  Future<void> _setToDB(PersonModel person) async {
    if (_teacher != null && _admin != null) {
      database
          .child(_admin!.uuid)
          .child('teachers')
          .child(_teacher!.uuid)
          .child('students')
          .child(person.uuid)
          .set({
        "uuid": person.uuid,
        "name": person.name,
      });
    }
  }

  void onRemove(PersonModel personModel) {
    students.remove(personModel);
    if (_teacher != null && _admin != null) {
      database
          .child(_admin!.uuid)
          .child('teachers')
          .child(_teacher!.uuid)
          .child('students')
          .child(personModel.uuid)
          .remove();
    }
    studentController.clear();
    notifyListeners();
  }
}
