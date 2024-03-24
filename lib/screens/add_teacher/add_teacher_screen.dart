import 'package:auto_route/auto_route.dart';
import 'package:flash/screens/add_teacher/teacher_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/person_model.dart';
import '../../utils/app_router.gr.dart';
import '../../utils/app_settings.dart';
import '../widgets/responsive_main_screen_widget.dart';

@RoutePage()
class AddTeacherScreen extends StatefulWidget {
  const AddTeacherScreen({super.key});

  @override
  State<AddTeacherScreen> createState() => _AddTeacherScreenState();
}

class _AddTeacherScreenState extends State<AddTeacherScreen> {
  @override
  void initState() {
    if (mounted) {
      final admin =
          Provider.of<AppSettings>(context, listen: false).currentAdmin;

      if (admin != null) {
        Provider.of<TeacherProvider>(context, listen: false).init(admin);
      } else {
        AutoRouter.of(context).navigate(const AddAdminRoute());
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watcher = Provider.of<TeacherProvider>(context);
    final reader = Provider.of<TeacherProvider>(context, listen: false);
    final appReader = Provider.of<AppSettings>(context, listen: false);
    final appWatcher = Provider.of<AppSettings>(context);

    if (appReader.currentAdmin != null) {
      return ResponsiveMainScreenWidget(
        title: 'Список учителей',
        subTitle: appWatcher.currentAdmin!.name,
        listData: watcher.teachers,
        addElement: reader.addTeacher,
        onDeleteElement: reader.onRemove,
        controller: watcher.teacherController,
        isStudent: false,
        onTapCard: (PersonModel value) {
          appReader.setupTeacher(value);
          AutoRouter.of(context).push(const AddStudentRoute());
        },
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
