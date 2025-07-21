import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasky/core/utils/app_shared_prefs.dart';
import 'package:tasky/features/auth/screens/login_screen.dart';
import 'package:tasky/features/auth/screens/register_screen.dart';
import 'package:tasky/features/tasks/screens/empty_tasks_screen.dart';
import 'package:tasky/features/tasks/screens/tasks_screen.dart';
import 'package:tasky/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPrefs.initSharedPrefs();
  String routeName = LoginScreen.pageRoute;
  AppSharedPrefs.getData('id').then((value) {
    if (value != null) {
      log('User ID: $value');
      routeName = TasksScreen.pageRoute;
    }
  });
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Tasky(routeName: routeName));
}

class Tasky extends StatelessWidget {
  const Tasky({super.key, required this.routeName});
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      initialRoute: routeName,
      routes: {
        LoginScreen.pageRoute: (context) => LoginScreen(),
        RegisterScreen.pageRoute: (context) => RegisterScreen(),
        EmptyTasksScreen.pageRoute: (context) => EmptyTasksScreen(),
        TasksScreen.pageRoute: (context) => TasksScreen(),
      },
    );
  }
}
