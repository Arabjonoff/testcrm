// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcrm/src/colors/colors.dart';
import 'package:testcrm/src/ui/login/login_screen.dart';

class ShowDialog{
  static void showMessageDialog(
      BuildContext context,
      String msg
      ){
    showDialog(context: context, builder: (context){
      return Scaffold(body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Text(
                    'Xatolik',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18 ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    msg,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'ok',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,);
    });
  }

  static void showLogoutDialog(
      BuildContext context,
      String msg
      ){
    showDialog(context: context, builder: (context){
      return Scaffold(body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Icon(Icons.logout,color: AppColor.green,),
                  const SizedBox(height: 10,),
                  const Text(
                    'Tizmdan chiqish',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18 ,),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    msg,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Bekor qilsh',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18,color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () async{
                          final prefs = await SharedPreferences.getInstance();
                          prefs.remove('token');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Chiqish',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
        backgroundColor: Colors.transparent,);
    });
  }
}