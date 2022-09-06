import 'package:flutter/material.dart';
import 'package:testcrm/src/colors/colors.dart';
import 'package:testcrm/src/ui/detail/detail_screen.dart';
import 'package:testcrm/src/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
        backgroundColor: AppColor.grey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          backgroundColor: AppColor.grey,
          foregroundColor: Colors.black,
          title: const Text('Baliqchi un yog bazasi'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 16 * w,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DetailScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15 * w),
                            width: 100 * w,
                            child: Image.asset(
                              'assets/icons/product.png',
                              color: AppColor.green,
                            ),
                          ),
                          Text(
                            'Mahsulot turlari',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18 * w),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15 * w),
                          width: 100 * w,
                          child: Image.asset(
                            'assets/icons/fruit.png',
                            color: Colors.indigo,
                          ),
                        ),
                        Text(
                          'Mevalar',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18 * w),
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
            SizedBox(
              height: 16 * w,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15 * w),
                          width: 100 * w,
                          child: Image.asset(
                            'assets/icons/vegetables.png',
                            color: Colors.indigo,
                          ),
                        ),
                        Text(
                          'Poliz ekinlari',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18 * w),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15 * w),
                          width: 100 * w,
                          child: Image.asset(
                            'assets/icons/parfumer.png',
                            color: Colors.indigo,
                          ),
                        ),
                        Text(
                          'Parfumeriya',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18 * w),
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
            SizedBox(
              height: 16 * w,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15 * w),
                    width: 100 * w,
                    child: Image.asset(
                      'assets/icons/textile1.png',
                      color: Colors.indigo,
                    ),
                  ),
                  Text(
                    'Tirkataj',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18 * w),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
