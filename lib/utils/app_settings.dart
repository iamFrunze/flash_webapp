import 'package:flutter/cupertino.dart';

import '../data/person_model.dart';
import '../res/app_dimensions.dart';

class AppSettings extends ChangeNotifier {
  PersonModel? currentAdmin;
  PersonModel? currentTeacher;
  PersonModel? currentStudent;

  void setupAdmin(PersonModel person) {
    currentAdmin = person;
    notifyListeners();
  }

  void setupTeacher(PersonModel person) {
    currentTeacher = person;
    notifyListeners();
  }

  void setupStudent(PersonModel person) {
    currentStudent = person;
    notifyListeners();
  }
}
