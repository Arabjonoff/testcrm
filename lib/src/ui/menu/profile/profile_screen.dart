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
      body: OrientationBuilder(builder: (context,orientation){
        if(orientation == Orientation.portrait){
          return Column(
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
                      const SizedBox(height: 8,),
                      Text('Test uchun'),
                      const SizedBox(height: 8,),
                      Text('1 233 212 so\'m',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),)
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
          );
        }
        else{
          return  Center(
            child: Container(
              height: MediaQuery.of(context).size.height/2,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(child: Text('T',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700),)),
                  ),
                  const SizedBox(height: 10,),
                  const Text('Test uchun',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 10,),
                  const Text('1 341 405 som',style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 16,),
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        border: Border(
                          bottom: BorderSide(width: 2, color: AppColor.grey),
                        )
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: const [
                        Padding(
                          padding:  EdgeInsets.all(10),
                          child: Icon(Icons.settings),
                        ),
                        Text('Sozlamalr',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_outlined),
                        SizedBox(width: 16,)
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        border: Border(
                          bottom: BorderSide(width: 2, color: AppColor.grey),
                        )
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: const [
                        Padding(
                          padding:  EdgeInsets.all(10),
                          child: Icon(Icons.shopping_bag_outlined),
                        ),
                        Text('Buyurtmalar',style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_outlined),
                        SizedBox(width: 16,)
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        border: Border(
                          bottom: BorderSide(width: 2, color: AppColor.grey),
                        )
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: const [
                        Padding(
                          padding:  EdgeInsets.all(10),
                          child: Icon(Icons.logout),
                        ),
                        Text('Chiqish',style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_outlined),
                        SizedBox(width: 16,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },)
    );
  }
}
