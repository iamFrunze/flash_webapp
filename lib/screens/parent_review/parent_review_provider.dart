import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../../data/person_model.dart';
import '../../data/review_model.dart';

class ParentReviewProvider extends ChangeNotifier {
  PersonModel? student;
  List<ParentReviewModel>? qualities;
  String month = DateTime.now().toString();
  final database = FirebaseDatabase.instance.ref("students");
  bool? isExists = true;

  Future<void> init(String id) async {
    final fetchStudent = await database.child(id).get();
    debugPrint('resolve ${fetchStudent.value}');
    if (fetchStudent.exists) {
      Map<dynamic, dynamic> studentParse =
          fetchStudent.value as Map<dynamic, dynamic>;

      Logger().w('student $studentParse');
      month = studentParse['month'];
      student = PersonModel(
        name: studentParse['name'],
        uuid: studentParse['uuid'],
      );

      qualities = [
        /// Common value
        ParentReviewModel(
          name:
              'Результаты коррекционной работы после проведения итогового тестирования первого полугодия обучения',
          quality: studentParse['qualities'][0] ?? '',
        ),
        ParentReviewModel(
          name: 'Говорение',
          quality: studentParse['qualities'][1] ?? '',
        ),
        ParentReviewModel(
          name: 'Чтение',
          quality: studentParse['qualities'][2] ?? '',
        ),
        ParentReviewModel(
          name: 'Аудирование',
          quality: studentParse['qualities'][3] ?? '',
        ),
        ParentReviewModel(
          name: 'Сочинения',
          quality: studentParse['qualities'][4] ?? '',
        ),
        ParentReviewModel(
          name: 'Старание и вовлеченность в процесс урока',
          quality: studentParse['qualities'][5] ?? '',
        ),
        ParentReviewModel(
          name: 'Дисциплина',
          quality: studentParse['qualities'][6] ?? '',
        ),

        /// Old value
        ParentReviewModel(
          name: 'Монолог',
          quality: studentParse['qualities'][7],
        ),
        ParentReviewModel(
          name: 'Диалог',
          quality: studentParse['qualities'][8],
        ),
        ParentReviewModel(
          name: 'Грамматика',
          quality: studentParse['qualities'][9],
        ),
        ParentReviewModel(
          name: 'Лексические темы',
          quality: studentParse['qualities'][10],
        ),
        ParentReviewModel(
          name: 'Чтение',
          quality: studentParse['qualities'][11],
        ),
        ParentReviewModel(
          name: 'Рекомендации',
          quality: studentParse['qualities'][12],
        ),
      ];
      isExists = true;
    }
    notifyListeners();
  }
}
