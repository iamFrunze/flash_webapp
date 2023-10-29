import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:teacher_review/screens/add_admin/admin_provider.dart';
import 'package:teacher_review/utils/app_router.gr.dart';

import '../widgets/responsive_main_screen_widget.dart';

@RoutePage()
class AddAdminScreen extends StatelessWidget {
  const AddAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final watcher = Provider.of<AdminProvider>(context);
    final reader = Provider.of<AdminProvider>(context, listen: false);

    return ResponsiveMainScreenWidget(
      title: 'Список администраторов',
      listData: watcher.admins,
      addElement: reader.addAdmin,
      onDeleteElement: reader.onRemove,
      controller: watcher.adminController,
      onTapCard: (PersonModel value) {
        AutoRouter.of(context).push(AddTeacherRoute(admin: value));
      },
    );
  }
}
