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
      student =
          PersonModel(name: studentParse['name'], uuid: studentParse['uuid']);
      qualities = [
        ParentReviewModel(
            name: 'Результаты коррекционной работы',
            quality: (studentParse['qualities'] as List<dynamic>)[0][0]),
        ParentReviewModel(
            name: 'Говорение',
            quality: (studentParse['qualities'] as List<dynamic>)[0][1]),
        ParentReviewModel(
            name: 'Чтение',
            quality: (studentParse['qualities'] as List<dynamic>)[0][2]),
        ParentReviewModel(
            name: 'Аудирование',
            quality: (studentParse['qualities'] as List<dynamic>)[0][3]),
        ParentReviewModel(
            name: 'Сочинение',
            quality: (studentParse['qualities'] as List<dynamic>)[0][4]),
        ParentReviewModel(
            name: 'Старание и вовлеченность в процесс  урока',
            quality: (studentParse['qualities'] as List<dynamic>)[0][5]),
        ParentReviewModel(
            name: 'Дисциплина',
            quality: (studentParse['qualities'] as List<dynamic>)[0][6]),
        ParentReviewModel(
            name: 'Рекомендации',
            quality: (studentParse['qualities'] as List<dynamic>)[0][7]),
      ];
      isExists = true;
    }
    notifyListeners();
  }
}
