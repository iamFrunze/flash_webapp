import 'package:flutter/material.dart';
import 'package:teacher_review/screens/add_admin/add_admin_screen.dart';
import 'package:teacher_review/utils/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      routerConfig: _appRouter.config(),
    );
  }
}
