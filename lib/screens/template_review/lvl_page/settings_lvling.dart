import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flash/data/person_model.dart';
import 'package:flash/data/review_model.dart';
import 'package:flash/screens/template_review/lvl_page/lvl_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_lvling.g.dart';

@riverpod
class LvlModel extends _$LvlModel {
  int currentPage = 0;
  final database = FirebaseDatabase.instance.ref("admins");
  PersonModel? admin;
  PersonModel? teacher;
  PersonModel? student;

  @override
  FutureOr<List<BoardElement>> build() async {
    Logger().e('Build');
    await _fetchData();
    if (state.value != null) {
      return state.value!;
    } else {
      return [];
    }
  }

  initPersons({
    required PersonModel admin,
    required PersonModel teacher,
    required PersonModel student,
  }) async {
    this.admin = admin;
    this.teacher = teacher;
    this.student = student;
    await initData();
  }

  Future<void> _fetchData() async {
    final String response = await rootBundle.loadString('assets/board.json');

    final Map<String, dynamic> jsonData = json.decode(response);

    state = AsyncData(Board.fromJson(jsonData).board);
  }

  void updateData(List<BoardElement> newElement) {
    state = AsyncData(newElement);
  }

  void changeLvl(String? value) {
    final boardIndex = state.value?.indexWhere((el) => el.lvl == value);
    ref
        .read(changePageProvider.notifier)
        .update((state) => state = boardIndex ?? 0);
    currentPage = boardIndex ?? 0;
  }

  Future<void> initData() async {
    if (student != null) {
      final fetchStudent = await FirebaseDatabase.instance
          .ref('students')
          .child(student!.uuid)
          .get();

      if (fetchStudent.exists) {
        Map<dynamic, dynamic> studentParse =
            fetchStudent.value as Map<dynamic, dynamic>;
        student = PersonModel(
          name: studentParse['name'],
          uuid: studentParse['uuid'],
          lvl: studentParse['lvl'] ?? 0,
        );
        currentPage = student!.lvl;
        ref
            .read(changePageProvider.notifier)
            .update((state) => state = currentPage);

        if (studentParse['qualities'] == null) {
          return;
        }
        final q0 = ParentReviewModel(
          name: 'Монолог',
          quality: studentParse['qualities'][0] ?? '',
        );
        final q1 = ParentReviewModel(
          name: 'Диалог',
          quality: studentParse['qualities'][1] ?? '',
        );
        final q2 = ParentReviewModel(
          name: 'Грамматика',
          quality: studentParse['qualities'][2] ?? '',
        );
        final q3 = ParentReviewModel(
          name: 'Лексические темы',
          quality: studentParse['qualities'][3] ?? '',
        );
        final q4 = ParentReviewModel(
          name: 'Чтение',
          quality: studentParse['qualities'][4] ?? '',
        );

        final rec0 = q0.quality.replaceAll(';', '').split('* ');
        final rec1 = q1.quality.replaceAll(';', '').split('* ');
        final rec2 = q2.quality.replaceAll(';', '').split('* ');
        final rec3 = q3.quality.replaceAll(';', '').split('* ');
        final rec4 = q4.quality.replaceAll(';', '').split('* ');

        final data = state.value;
        if (data != null) {
          data[currentPage].themes[0].values.forEachIndexed((index, el) {
            if (rec0.contains(el)) {
              data[currentPage].themes[0].selected[index] = true;
            }
          });
          data[currentPage].themes[1].values.forEachIndexed((index, el) {
            if (rec1.contains(el)) {
              data[currentPage].themes[1].selected[index] = true;
            }
          });
          data[currentPage].themes[2].values.forEachIndexed((index, el) {
            if (rec2.contains(el)) {
              data[currentPage].themes[2].selected[index] = true;
            }
          });
          data[currentPage].themes[3].values.forEachIndexed((index, el) {
            if (rec3.contains(el)) {
              data[currentPage].themes[3].selected[index] = true;
            }
          });
          data[currentPage].themes[4].values.forEachIndexed((index, el) {
            if (rec4.contains(el)) {
              data[currentPage].themes[4].selected[index] = true;
            }
          });
          state = AsyncData(data);
        }
      }
    }
  }

  Future<void> saveData() async {
    final data = state.value;
    if (admin != null && teacher != null && student != null && data != null) {
      final qualities = data[currentPage];
      final themes = qualities.themes;
      final rec = List.generate(themes.length, (_) => '');

      themes.forEachIndexed((indexTheme, elementTheme) {
        elementTheme.selected.forEachIndexed((index, element) {
          if (element) {
            rec[indexTheme] += '* ${elementTheme.values[index]};';
          }
        });
      });

      await FirebaseDatabase.instance.ref('students').child(student!.uuid).set({
        "name": student!.name,
        "uuid": student!.uuid,
        "month": DateTime.now().month,
        "lvl": currentPage,
        "qualities": rec,
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
        "month": DateTime.now().month,
        "lvl": currentPage,
        "qualities": rec,
      });
    }
  }
}

final changePageProvider = StateProvider<int>((ref) => 0);
