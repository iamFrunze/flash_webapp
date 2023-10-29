import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';
import 'package:teacher_review/app.dart';
import 'package:teacher_review/screens/add_admin/admin_provider.dart';
import 'package:teacher_review/screens/add_student/student_provider.dart';
import 'package:teacher_review/screens/add_teacher/teacher_provider.dart';
import 'package:teacher_review/screens/template_review/template_review_provider.dart';
import 'package:teacher_review/utils/app_settings.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseDatabase.instance;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => AdminProvider()),
        ChangeNotifierProvider(create: (context) => TeacherProvider()),
        ChangeNotifierProvider(create: (context) => StudentProvider()),
        ChangeNotifierProvider(create: (context) => TemplateReviewProvider()),
      ],
      child: const App(),
    ),
  );
}
