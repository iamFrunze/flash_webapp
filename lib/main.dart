import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flash/screens/add_admin/admin_provider.dart';
import 'package:flash/screens/add_student/student_provider.dart';
import 'package:flash/screens/add_teacher/teacher_provider.dart';
import 'package:flash/screens/parent_review/parent_review_provider.dart';
import 'package:flash/screens/template_review/template_review_provider.dart';
import 'package:flash/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // usePathUrlStrategy();

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
        ChangeNotifierProvider(create: (context) => ParentReviewProvider()),
      ],
      child: const App(),
    ),
  );
}
