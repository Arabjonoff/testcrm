import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcrm/src/ui/login/login_screen.dart';
import 'package:testcrm/src/ui/menu/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState(){
    _navigateMain;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
  _navigateMain()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? '';
    await Future.delayed(const Duration(milliseconds: 150),(){});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return token == '' ? const LoginScreen():const MainScreen();
    },),);
  }
}
