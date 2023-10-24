import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:teacher_review/app.dart';
import 'package:teacher_review/utils/app_settings.dart';

void main() async {
  usePathUrlStrategy();
  await GetStorage.init();
  const firebaseConfig = {
    'apiKey': "AIzaSyC15MWJMVX1J4Z3aqDkXhjCciNMdolVh0A",
    'authDomain': "flash-webapp-8b454.firebaseapp.com",
    'projectId': "flash-webapp-8b454",
    'storageBucket': "flash-webapp-8b454.appspot.com",
    'messagingSenderId': "78093457850",
    'appId': "1:78093457850:web:f50ef19648287abe0ce583"
  };

// Initialize Firebase
  const app = initializeApp(firebaseConfig);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
      ],
      child: const MaterialApp(home: App()),
    ),
  );
}
