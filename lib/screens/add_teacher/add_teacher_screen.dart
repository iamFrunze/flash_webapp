import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:teacher_review/screens/add_teacher/teacher_provider.dart';

import '../../utils/app_router.gr.dart';
import '../widgets/responsive_main_screen_widget.dart';

@RoutePage()
class AddTeacherScreen extends StatefulWidget {
  const AddTeacherScreen({super.key, required this.admin});

  final PersonModel admin;

  @override
  State<AddTeacherScreen> createState() => _AddTeacherScreenState();
}

class _AddTeacherScreenState extends State<AddTeacherScreen> {
  @override
  void initState() {
    Provider.of<TeacherProvider>(context, listen: false).init(widget.admin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watcher = Provider.of<TeacherProvider>(context);
    final reader = Provider.of<TeacherProvider>(context, listen: false);

    return ResponsiveMainScreenWidget(
      title: 'Список учителей',
      subTitle: widget.admin.name,
      listData: watcher.teachers,
      addElement: reader.addTeacher,
      onDeleteElement: reader.onRemove,
      controller: watcher.teacherController,
      onTapCard: (PersonModel value) {
        AutoRouter.of(context).push(AddStudentRoute(
          teacher: value,
          admin: widget.admin,
        ));
      },
    );
  }
}
