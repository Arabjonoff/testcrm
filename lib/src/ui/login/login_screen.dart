// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcrm/src/colors/colors.dart';
import 'package:testcrm/src/dialog/dialog.dart';
import 'package:testcrm/src/model/control/control.dart';
import 'package:testcrm/src/model/http_result.dart';
import 'package:testcrm/src/model/login/login_model.dart';
import 'package:testcrm/src/repository/repository.dart';
import 'package:testcrm/src/ui/menu/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _dbController = TextEditingController();
TextEditingController _numController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 90,
                height: 90,
                child: Image.asset('assets/icons/logo.png',fit: BoxFit.cover,)),
            const SizedBox(height: 50,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 57,
              child: TextField(
                controller: _dbController,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  labelStyle: const TextStyle(color: Colors.grey),
                  enabledBorder:   OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: Colors.grey ),
                  ),
                  focusedBorder:   OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: AppColor.green ),
                  ),
                  hintText: 'Baza raqamini kiriting',
                  labelText: 'Baza raqami',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset('assets/icons/database.png',color: AppColor.green,),
                  ),
                  prefixText: ' ',
                ),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 57,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _numController,
                decoration:  InputDecoration(
                  labelStyle: const TextStyle(color: Colors.grey),
                  enabledBorder:   OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: Colors.grey ),
                  ),
                  focusedBorder:   OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: AppColor.green ),
                  ),
                  hintText: 'Telefon raqamni kiriting ',
                  labelText: 'Telfon raqam',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/icons/phone.png',color: AppColor.green,),
                  ),
                  prefixText: ' ',
                ),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: 57,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _passwordController,
                decoration:   InputDecoration(
                  labelStyle: const TextStyle(color: Colors.grey),
                  enabledBorder:   OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: Colors.grey ),
                  ),
                  focusedBorder:   OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:  BorderSide(color: AppColor.green),
                  ),
                  hintText: 'Parolni kiriting',
                  labelText: 'parol',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset('assets/icons/password.png',color: AppColor.green,),
                  ),
                  prefixText: ' ',
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                _sendData(
                  _dbController.text,
                  _numController.text,
                  _passwordController.text,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16,right: 16,top: 16),
                width: MediaQuery.of(context).size.width,
                height: 57,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.green
                ),
                child:  Center(
                  child:  _loading
                      ? const CircularProgressIndicator(
                    backgroundColor: AppColor.white,
                    color: AppColor.green,
                  )
                      : const Text(
                    'Kirish',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 20 ,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _sendData(
      String db,number, password
      ) async {
    Repository _repo = Repository();
    setState(() {
      _loading = true;
    });
    HttpResult response = await _repo.login(db,number,password);
    if (response.isSuccess) {
      setState(() {
        _loading = false;
      });
      var result = LoginModel.fromJson(response.result);
      // ignore: unrelated_type_equality_checks
      if(result.status == true && result.d1 == 1){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token',result.jwt);
        await prefs.setString('password',_passwordController.text);
        await prefs.setString('username',_numController.text);
        await prefs.setString('db',_dbController.text);
        Control.control[0]['D2'] = result.d2;
        Control.control[0]['D3'] = result.d3;
        Control.control[0]['D4'] = result.d4;
        Control.control[0]['name'] = result.name;
        Control.control[0]['DB'] = _dbController.text;
        Control.control[0]['ID_T'] = result.idT;
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const MainScreen();
            },
          ),
        );
        setState(() {
          _loading = false;
        });
      }
      else{
        ShowDialog.showMessageDialog(context, result.message);
        setState(() {
          _loading = false;
        });
      }
    }
  }
}
