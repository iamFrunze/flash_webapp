import 'package:auto_route/auto_route.dart';
import 'package:flash/screens/add_student/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/person_model.dart';
import '../../utils/app_router.gr.dart';
import '../../utils/app_settings.dart';
import '../widgets/responsive_main_screen_widget.dart';

@RoutePage()
class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({
    super.key,
  });

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  @override
  void initState() {
    if (mounted) {
      final admin =
          Provider.of<AppSettings>(context, listen: false).currentAdmin;
      final teacher =
          Provider.of<AppSettings>(context, listen: false).currentTeacher;
      if (admin != null && teacher != null) {

        Provider.of<StudentProvider>(context, listen: false)
            .init(admin, teacher);
      } else {
        AutoRouter.of(context).navigate(const AddAdminRoute());
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watcher = Provider.of<StudentProvider>(context);
    final reader = Provider.of<StudentProvider>(context, listen: false);
    final appReader = Provider.of<AppSettings>(context);
    final appWatcher = Provider.of<AppSettings>(context);


    if (appReader.currentTeacher != null) {
      return ResponsiveMainScreenWidget(
        title: 'Список учеников',
        subTitle: 'Учитель: ${appWatcher.currentTeacher!.name}',
        listData: watcher.students,
        addElement: reader.addStudent,
        onDeleteElement: reader.onRemove,
        isStudent: true,
        controller: watcher.studentController,
        onTapCard: (PersonModel value) {
          appReader.setupStudent(value);
          AutoRouter.of(context).push(
            ResponsiveTemplateReviewRoute(id: value.uuid),
          );
        },
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
