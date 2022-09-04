import 'package:flutter/material.dart';
import 'package:testcrm/src/ui/login/login_screen.dart';
import 'package:testcrm/src/ui/menu/home/home_screen.dart';
import 'package:testcrm/src/ui/menu/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
