import 'package:collection/collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/person_model.dart';
import '../../data/review_model.dart';

class TemplateReviewProvider extends ChangeNotifier {
  final qualities1 = <ReviewModel>[
    quality1,
    quality2,
    quality3,
    quality4,
    quality5,
    quality6,
    quality7,
    quality8,
    quality9,
  ];
  final qualities2 = <ReviewModel>[
    quality1,
    quality2,
    quality3,
    quality4,
    quality5,
    quality6,
    quality7,
    quality8,
    quality9,
  ];

  List<ReviewModel> qualities = [];

  TemplateReviewProvider() {
    qualities = qualities1;
    notifyListeners();
  }

  /// плашка с уровнями

  final levels = [
    '1 уровень',
    '2 уровень',
    '3 уровень',
    '4 уровень',
    '5 уровень',
    '6 уровень',
    '7 уровень',
  ];
  String currentSelected = '';

  PersonModel? admin;
  PersonModel? teacher;
  PersonModel? student;
  final database = FirebaseDatabase.instance.ref("admins");
  final TextEditingController monthController = TextEditingController(
    text: DateFormat.yMMMM('ru').format(DateTime.now()),
  );

  /// C ЧЕКБОКСОВ
  late List<bool> recomendationQuality =
      List.generate(qualities1.last.values.length, (index) => false);
  final List<String> rec = [];

  ///TODO (iam) ЕСЛИ БЛЯТЬ ПОЯВИТСЯ ПЛАШКА С УРОВНЯМИ
  void onSelectedDropLevel(String? str) {
    currentSelected = str ?? levels.first;
    if (str != null && str == levels.first) {
      qualities = qualities1;
    } else {
      qualities = qualities2;
    }
    notifyListeners();
  }

  void setupDate(DateTimeRange date) {
    final dateStart = date.start;
    final dateEnd = date.end;

    if (dateStart.month != dateEnd.month) {
      monthController.text =
          'c ${DateFormat.yMMMM('ru').format(date.start)} по ${DateFormat.yMMMM('ru').format(date.end)}';
    } else {
      monthController.text = 'за ${DateFormat.yMMMM('ru').format(date.start)}';
    }

    notifyListeners();
  }

  /// ЧЕК БОКС
  void checkRec(int index, bool? value) {
    recomendationQuality[index] = value ?? false;
    if (value != null && value) {
      rec.add(qualities.last.values[index]);
    } else {
      rec.remove(qualities.last.values[index]);
    }
    notifyListeners();
  }

  void setupPersons({
    required PersonModel admin,
    required PersonModel teacher,
    required PersonModel student,
  }) async {
    this.admin = admin;
    this.teacher = teacher;
    this.student = student;

    /// БЕЗ ЧЕКБОКСОВ
    rec.clear();
    recomendationQuality =
        List.generate(qualities.last.values.length, (index) => false);
    qualities.last.currentValue = '';
    /******/

    final fetchStudent = await FirebaseDatabase.instance
        .ref('students')
        .child(student.uuid)
        .get();

    if (fetchStudent.exists) {
      Map<dynamic, dynamic> studentParse =
          fetchStudent.value as Map<dynamic, dynamic>;
      student = PersonModel(
        name: studentParse['name'],
        uuid: studentParse['uuid'],
      );
      //
      // final fromQualities = [
      //   ParentReviewModel(
      //       name: 'Лексика',
      //       quality: (studentParse['qualities'] as List<dynamic>)[0][0] ?? ''),
      //   ParentReviewModel(
      //       name: 'Грамматика',
      //       quality: (studentParse['qualities'] as List<dynamic>)[0][1] ?? ''),
      //   ParentReviewModel(
      //       name: 'Чтение',
      //       quality: (studentParse['qualities'] as List<dynamic>)[0][2] ?? ''),
      //   ParentReviewModel(
      //       name: 'Аудирование',
      //       quality: (studentParse['qualities'] as List<dynamic>)[0][3] ?? ''),
      //   ParentReviewModel(
      //       name: 'Говорение',
      //       quality: (studentParse['qualities'] as List<dynamic>)[0][4] ?? ''),
      //   ParentReviewModel(
      //       name: 'Сочинения',
      //       quality: (studentParse['qualities'] as List<dynamic>)[0][5] ?? ''),
      //   ParentReviewModel(
      //       name: 'Старание и вовлеченность в процесс  урока',
      //       quality: (studentParse['qualities'] as List<dynamic>)[0][6] ?? ''),
      //   ParentReviewModel(
      //       name: 'Дисциплина',
      //       quality: (studentParse['qualities'] as List<dynamic>)[0][7] ?? ''),
      //   ParentReviewModel(
      //       name: 'Рекомендации',
      //       quality: (studentParse['qualities'] as List<dynamic>)[0][8] ?? ''),
      // ];
      // qualities.mapIndexed((index, element) {
      //   element.currentValue = fromQualities[index].quality;
      // }).toList();
      // debugPrint('student = ${qualities.last.currentValue}');
      final rec = qualities.last.currentValue.replaceAll('\n', '').split('* ');
      debugPrint('кус = ${rec}');

      /// CHECK BOX
      recomendationQuality =
          qualities1.last.values.mapIndexed((index, element) {
        if (rec.contains(element)) {
          return true;
        } else {
          return false;
        }
      }).toList();
      // debugPrint('кус = ${recomendationQuality}');

      notifyListeners();
    }
  }

  void changeCurrentQuality(int index, String? value) {
    qualities[index].currentValue = value ?? qualities[index].values.first;
    notifyListeners();
  }

  Future<void> save() async {
    /// БЕЗ ЧЕКБОКСОВ
    rec.clear();
    recomendationQuality.forEachIndexed((index, element) {
      if (element) {
        rec.add('* ${qualities.last.values[index]}');
      }
    });
    debugPrint('reg $rec');
    qualities.last.currentValue = rec.join('\n');
    /******/

    if (teacher != null && admin != null && student != null) {
      await FirebaseDatabase.instance.ref('students').child(student!.uuid).set({
        "name": student!.name,
        "uuid": student!.uuid,
        "month": monthController.text,
        "qualities": [qualities.map((e) => e.currentValue).toList()],
      });

      await database
          .child(admin!.uuid)
          .child('teachers')
          .child(teacher!.uuid)
          .child('students')
          .child(student!.uuid)
          .set({
        "name": student!.name,
        "uuid": student!.uuid,
        "month": monthController.text,
        "qualities": [qualities.map((e) => e.currentValue).toList()],
      });
      // .update(
      // {
      //   "qualities": [qualities.map((e) => e.currentValue).toList()],
      // },
      // );
    }
  }
}
