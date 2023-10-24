import 'package:flutter/material.dart';
import 'package:idb_sqflite/idb_client_sqflite.dart';
import 'package:idb_sqflite/idb_sqflite.dart';
import 'package:provider/provider.dart';
import 'package:teacher_review/screens/add_admin/add_admin_mobiile_screen.dart';
import 'package:teacher_review/screens/add_admin/add_admin_web_screen.dart';
import 'package:teacher_review/utils/app_settings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    final watcher = Provider.of<AppSettings>(context);
    Provider.of<AppSettings>(context, listen: false).initDisplayState(context);

    switch (watcher.displayMode) {
      case DisplayMode.desktop:
        return const AddAdminWebScreen();
      case DisplayMode.mobile:
        return const AddAdminMobileScreen();
    }
  }
}
