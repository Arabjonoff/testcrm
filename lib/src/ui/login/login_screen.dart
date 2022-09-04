import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
                      _getData(
                        _dbController.text,
                        _numController.text,
                        int.parse(_passwordController.text)
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
                              _getData(
                                  _dbController.text,
                                  _numController.text,
                                  int.parse(_passwordController.text)
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
}
_getData(String db,String num,int password) async {
  String url = "https://naqshsoft.site/login_tr3?DB=$db&username=$num&pass=$password&";
  print(url);
  http.Response response = await http.get(
    Uri.parse(url),
  );
  print(response.statusCode);
  print(response.body);
}