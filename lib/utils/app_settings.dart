import 'package:flutter/cupertino.dart';
import 'package:teacher_review/data/person_model.dart';

import '../res/app_dimensions.dart';

class AppSettings extends ChangeNotifier {
  late PersonModel currentAdmin;
  late PersonModel currentTeacher;
  late PersonModel currentStudent;
}
