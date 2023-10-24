import 'package:flutter/cupertino.dart';
import 'package:teacher_review/screens/widgets/tiles.dart';

enum DisplayMode {
  desktop,
  mobile,
}

class AppSettings extends ChangeNotifier {
  late DisplayMode displayMode;
  final List<TilesWidget> teachers = [];
  final List<TilesWidget> students = [];

  void initDisplayState(context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1024) {
      displayMode = DisplayMode.desktop;
    } else {
      displayMode = DisplayMode.mobile;
    }
  }

  void addTeacher(String fio, String desc) {
    teachers.add(TilesWidget(title: fio, subTitle: desc));
    notifyListeners();
  }
}
