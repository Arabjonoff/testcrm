import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcrm/src/ui/login/login_screen.dart';
import 'package:testcrm/src/ui/menu/main_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token") ?? '';
  runApp( MyApp(token: token,));
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({Key? key, required this.token}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: token == '' ? const LoginScreen():const MainScreen(),
    );
  }
}
