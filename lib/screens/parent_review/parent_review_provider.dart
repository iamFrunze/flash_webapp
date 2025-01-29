import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import '../../data/person_model.dart';
import '../../data/review_model.dart';

class ParentReviewProvider extends ChangeNotifier {
  PersonModel? student;
  List<ParentReviewModel>? qualities;
  String month = DateTime.now().toString();
  final database = FirebaseDatabase.instance.ref("students");
  bool? isExists = false;

  Future<void> init(String id) async {
    final fetchStudent = await database.child(id).get();
    debugPrint('resolve ${fetchStudent.value}');
    if (fetchStudent.exists) {
      Map<dynamic, dynamic> studentParse =
          fetchStudent.value as Map<dynamic, dynamic>;
      month = studentParse['month'];
      student = PersonModel(
        name: studentParse['name'],
        uuid: studentParse['uuid'],
      );

      qualities = [
        ParentReviewModel(
          name: 'Монолог',
          quality: studentParse['qualities'][0],
        ),
        ParentReviewModel(
          name: 'Диалог',
          quality: studentParse['qualities'][1],
        ),
        ParentReviewModel(
          name: 'Грамматика',
          quality: studentParse['qualities'][2],
        ),
        ParentReviewModel(
          name: 'Лексические темы',
          quality: studentParse['qualities'][3],
        ),
        ParentReviewModel(
          name: 'Чтение',
          quality: studentParse['qualities'][4],
        ),
      ];
      isExists = true;
    }
    notifyListeners();
  }
}
