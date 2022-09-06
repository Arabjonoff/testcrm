import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testcrm/src/colors/colors.dart';
import 'package:testcrm/src/dialog/dialog.dart';
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
      body: OrientationBuilder(
        builder: (context, orientation){
          if(orientation == Orientation.portrait){
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                      height: 90,
                      child: Image.asset('assets/icons/logo.png',fit: BoxFit.cover,)),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    height: 57,
                    child: TextField(
                      controller: _dbController,
                      decoration:  InputDecoration(
                        labelStyle: const TextStyle(color: Colors.grey),
                        enabledBorder:  const OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey ),
                        ),
                        focusedBorder:  const OutlineInputBorder(
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

                      controller: _numController,
                      decoration:  InputDecoration(
                        labelStyle: const TextStyle(color: Colors.grey),
                        enabledBorder:  const OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey ),
                        ),
                        focusedBorder:  const OutlineInputBorder(
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
                      controller: _passwordController,
                      decoration:   InputDecoration(
                        labelStyle: const TextStyle(color: Colors.grey),
                        enabledBorder:  const OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.grey ),
                        ),
                        focusedBorder:  const OutlineInputBorder(
                          borderSide:  BorderSide(color: AppColor.green ),
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
                        int.parse(_passwordController.text),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      width: MediaQuery.of(context).size.width,
                      height: 57,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
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
            );
          }else{
            return SafeArea(
              child:Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.indigo,
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height /1.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                      ),
                      width: 400,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.indigo
                            ),
                            child: Center(child: Text('Logo',style: const TextStyle(color: Colors.white),)),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            width: MediaQuery.of(context).size.width,
                            height: 57,
                            child: TextField(
                              controller: _dbController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),),
                                hintText: 'Baza raqamini kiriting',
                                labelText: 'Baza raqami',
                                prefixIcon: Icon(
                                  Icons.login,
                                  color: Colors.green,
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
                              controller: _numController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                ),
                                hintText: 'Telefon raqamni kiriting ',
                                labelText: 'Telfon raqam',
                                prefixIcon: Icon(
                                  Icons.login,
                                  color: Colors.green,
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
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),),
                                hintText: 'Parolni kiriting',
                                labelText: 'parol',
                                prefixIcon: Icon(
                                  Icons.login,
                                  color: Colors.green,
                                ),
                                prefixText: ' ',
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return MainScreen();
                              }));
                              _sendData(
                                  _dbController.text,
                                  _numController.text,
                              _passwordController.text,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                              width: MediaQuery.of(context).size.width,
                              height: 57,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.indigo
                              ),
                              child: const Center(child:
                              Text('Kirish',style: TextStyle(color: Colors.white,fontSize: 18),),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            );
          }
        },
      ),
    );
  }
  _sendData(
      String number,db, password
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
      if(result.status == 'true'){
        // ignore: use_build_context_synchronously
        Navigator.push(
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
        // ignore: use_build_context_synchronously
        ShowDialog.showMessageDialog(context, result.message);
        setState(() {
          _loading = false;
        });
      }
    } else {
      // ignore: use_build_context_synchronously
      ShowDialog.showMessageDialog(context, 'Nimadur xato qaytadan tering');
      setState(() {
        _loading = false;
      });
    }
  }
}
