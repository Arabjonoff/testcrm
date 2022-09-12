import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testcrm/src/bloc/cart_bloc/cart_bloc.dart';
import 'package:testcrm/src/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:testcrm/src/colors/colors.dart';
import 'package:testcrm/src/model/product_model/product_detail_model/product_detail.dart';
import 'package:testcrm/src/ui/menu/cart/cart_screen.dart';
import 'package:testcrm/src/utils/utils.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String name;
  const DetailScreen({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  initState() {
    var format = DateFormat();
    print(format);
    cartBloc.allCart();
    productDetailBloc.getAllProducts('002', '2022', '9', 1, widget.id);
    super.initState();
  }

  int count = 0;
  final int _gridCount = 2;
  bool _buttonPressed = false;
  bool _loopActive = false;
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        backgroundColor: AppColor.grey,
        elevation: 1,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: Text(widget.name),
        actions: [
          StreamBuilder<List<DetailResult>>(
            stream: cartBloc.getCard,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Container(
                  child: snapshot.data!.isEmpty
                      ? IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CartScreen();
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                  )
                      : Badge(
                    position: BadgePosition.topEnd(top: 0, end: 5),
                    animationType: BadgeAnimationType.scale,
                    badgeContent: Text(
                      snapshot.data!.length.toInt().toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const CartScreen();
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart),
                    ),
                  ),
                );
              }
              return Container();
            }
          ),
        ],
      ),
      body: StreamBuilder<ProductDetailModel>(
          stream: productDetailBloc.getDetailProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DetailResult> data = snapshot.data!.result;
              return data.isEmpty
                  ? Center(
                      child: Image.asset(
                        'assets/icons/box.png',
                        color: AppColor.orange,
                        width: 65,
                      ),
                    )
                  : ListView.builder(
                      itemCount: (data.length + _gridCount - 1) ~/ _gridCount,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 16 * w,
                                ),
                                Expanded(
                                  child: FadeInRight(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 26 * w,
                                        ),
                                        Container(
                                          width: 180 * w,
                                          height: 140 * w,
                                          decoration: BoxDecoration(
                                            color: AppColor.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Image.asset(
                                                  'assets/icons/logo.png')),
                                        ),
                                        SizedBox(
                                          height: 8 * w,
                                        ),
                                        SizedBox(
                                          width: 180 * w,
                                          child: Text(
                                            data[index * _gridCount].name,
                                            style: TextStyle(
                                              fontSize: 18 * w,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5 * w,
                                        ),
                                        Text(
                                          "Narxi: ${data[index * _gridCount].snarhi.toInt()} UZS",
                                          style: TextStyle(
                                            color: AppColor.orange,
                                            fontSize: 18 * w,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8 * w,
                                        ),
                                        SizedBox(
                                          height: 10 * w,
                                        ),
                                        data[index*_gridCount].count == 0?GestureDetector(
                                          onTap: (){

                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 40 * w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                                color: AppColor.green),
                                            child: Center(
                                              child: Text(
                                                'Savatga olish',
                                                style: TextStyle(
                                                    color: AppColor.white,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 17 * w),
                                              ),
                                            ),
                                          ),
                                        ):Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 40*w,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.green,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: IconButton(onPressed: (){
                                                    setState((){
                                                      productDetailBloc.updateCart(data[index*_gridCount], true);
                                                    });
                                                  },icon:  const Icon(Icons.remove,color: AppColor.white,),padding: EdgeInsets.zero,),                                              ),
                                              ),
                                              const Spacer(),
                                              Expanded(child: Center(child: Text(data[index*_gridCount].count.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),),),
                                              const Spacer(),
                                              Expanded(
                                                child: Container(
                                                  height: 40*w,
                                                  decoration: BoxDecoration(
                                                    color: AppColor.green,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: IconButton(onPressed: (){
                                                    setState((){
                                                      productDetailBloc.updateCart(data[index*_gridCount], false);
                                                    });
                                                  },icon:  const Icon(Icons.add,color: AppColor.white,),padding: EdgeInsets.zero,),                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16 * w,
                                ),
                                Expanded(
                                  child: index * _gridCount + 1 >= data.length
                                      ? Container()
                                      : FadeInRight(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 26 * w,
                                            ),
                                            Container(
                                              width: 180 * w,
                                              height: 140 * w,
                                              decoration: BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                  child: Image.network(
                                                      'https://naqshsoft.site/images/phpqPLebH')),
                                            ),
                                            SizedBox(
                                              height: 8 * w,
                                            ),
                                            SizedBox(
                                              width: 180 * w,
                                              child: Text(
                                                data[index * _gridCount + 1]
                                                    .name,
                                                style: TextStyle(
                                                  fontSize: 18 * w,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5 * w,
                                            ),
                                            Text(
                                              "Narxi: ${data[index * _gridCount + 1].narhi.toInt()} UZS",
                                              style: TextStyle(
                                                color: AppColor.orange,
                                                fontSize: 18 * w,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8 * w,
                                            ),
                                            SizedBox(
                                              height: 10 * w,
                                            ),
                                            data[index*_gridCount+1].count > 0?Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40 * w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                  color: AppColor.green),
                                              child: Center(
                                                child: Text(
                                                  'Savatga olish',
                                                  style: TextStyle(
                                                      color: AppColor.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17 * w),
                                                ),
                                              ),
                                            ):GestureDetector(
                                              onTap:(){
                        productDetailBloc.updateCart(data[index*_gridCount+1], false);
                        },
                                              child: SizedBox(
                                                width: MediaQuery.of(context).size.width,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 40*w,
                                                        decoration: BoxDecoration(
                                                          color: AppColor.green,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: IconButton(onPressed: (){
                                                          productDetailBloc.updateCart(data[index*_gridCount+1], true);
                                                        },icon:  const Icon(Icons.remove,color: AppColor.white,),padding: EdgeInsets.zero,),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Expanded(child: Center(child: Text(data[index*_gridCount+1].count.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),),),
                                                    const Spacer(),
                                                    Expanded(
                                                      child: Container(
                                                        height: 40*w,
                                                        decoration: BoxDecoration(
                                                          color: AppColor.green,
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                        child: IconButton(onPressed: (){
                                                          productDetailBloc.updateCart(data[index*_gridCount+1], false);
                                                        },icon:  const Icon(Icons.add,color: AppColor.white,),padding: EdgeInsets.zero,),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
            }
            return Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: 30,
                  ),
                ),
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.green,
                    strokeWidth: 2,
                  ),
                ),
              ],
            );
          }),
    );
  }

}
