import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:teacher_review/screens/add_student/student_provider.dart';
import 'package:teacher_review/utils/app_router.gr.dart';

import '../widgets/responsive_main_screen_widget.dart';

@RoutePage()
class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({
    super.key,
    required this.teacher,
    required this.admin,
  });

  final PersonModel teacher;
  final PersonModel admin;

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  @override
  void initState() {
    Provider.of<StudentProvider>(context, listen: false)
        .init(widget.admin, widget.teacher);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watcher = Provider.of<StudentProvider>(context);
    final reader = Provider.of<StudentProvider>(context, listen: false);

    return ResponsiveMainScreenWidget(
      title: 'Список учеников',
      subTitle: 'Учитель: ${widget.teacher.name}',
      listData: watcher.students,
      addElement: reader.addStudent,
      onDeleteElement: reader.onRemove,
      controller: watcher.studentController,
      onTapCard: (PersonModel value) {
        AutoRouter.of(context).navigate(
          ResponsiveTemplateReviewRoute(id: value.uuid, student: value),
        );
      },
    );
  }
}
