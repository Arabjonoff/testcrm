import 'package:flutter/material.dart';
import 'package:testcrm/src/colors/colors.dart';

import '../../../utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                SizedBox(height: 32*w,),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.grey
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(22.0*w),
                      child: Icon(Icons.question_mark,size: 44*w,),
                    ),
                  ),
                ),
                Text('Test uchun')
              ],
            )
          ),
          SizedBox(height: 16*w,),
          Container(
            decoration: BoxDecoration(
                color: AppColor.white,
                border: Border(
                  bottom: BorderSide(width: 1.1*w, color: AppColor.grey),
                )
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.all(16.0*w),
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
                  bottom: BorderSide(width: 1.1*w, color: AppColor.grey),
                )
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.all(16.0*w),
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
                  bottom: BorderSide(width: 1.1*w, color: AppColor.grey),
                )
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.all(16.0*w),
                  child: Icon(Icons.logout_rounded),
                ),
                Text('Chiqish')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
