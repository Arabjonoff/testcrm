import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testcrm/src/bloc/ustd_course/usdt_course.dart';
import 'package:testcrm/src/colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:testcrm/src/model/usd_course/usd.dart';
import '../../../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int debt = 0;
  @override
  initState(){
    _getData();
    courseBloc.getAllUsd('002');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
        backgroundColor: AppColor.grey,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: AppColor.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 32 * w,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.grey),
                      child: Padding(
                        padding: EdgeInsets.all(22.0 * w),
                        child: Icon(
                          Icons.question_mark,
                          size: 44 * w,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('Test uchun'),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '$debt so\'m',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  StreamBuilder<UsdModel>(
                    stream: courseBloc.getUsd,
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Kurs'),
                            Text("${snapshot.data!.kurs} so'm",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                          ],
                        );
                      }
                      return Container();
                    }
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16 * w,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border(
                    bottom:
                    BorderSide(width: 1.1 * w, color: AppColor.grey),
                  )),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0 * w),
                    child: Icon(Icons.settings),
                  ),
                  Text('Sozlamalr')
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border(
                    bottom:
                    BorderSide(width: 1.1 * w, color: AppColor.grey),
                  )),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0 * w),
                    child: Icon(Icons.shopping_bag_outlined),
                  ),
                  Text('Buyurtmalar')
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border(
                    bottom:
                    BorderSide(width: 1.1 * w, color: AppColor.grey),
                  )),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0 * w),
                    child: Icon(Icons.logout_rounded),
                  ),
                  Text('Chiqish')
                ],
              ),
            ),
          ],
        ),);
  }

  _getData() async {
    String url =
        'https://naqshsoft.site/karzi?DB=002&ID_TOCH=001&YIL=2022&OY=8&TP=0&';
    http.Response response = await http.get(
      Uri.parse(url),
    );
    Map valueMap = json.decode(response.body);
    valueMap['KARZI'] = debt;
    print(valueMap);
  }
}
