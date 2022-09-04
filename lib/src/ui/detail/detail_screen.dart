import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:testcrm/src/colors/colors.dart';
import 'package:testcrm/src/ui/menu/cart/cart_screen.dart';
import 'package:testcrm/src/utils/utils.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 0, count1 = 0, count2 = 0, count3 = 0;
  bool list = true;

  @override
  Widget build(BuildContext context) {
    double w = Utils.getWidth(context);
    double h = Utils.getHeight(context);
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        backgroundColor: AppColor.grey,
        elevation: 1,
        centerTitle: false,
        foregroundColor: Colors.black,
        title: const Text('Maxsulot turlari'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                list = !list;
              });
              print(list);
            },
            icon:  list?Icon(Icons.view_column):Icon(Icons.list),
          ),
          count == 0
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
                    count.toString(),
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
        ],
      ),
      body: SingleChildScrollView(
          child: list
              ? Column(
                  children: [
                    SizedBox(
                      height: 24 * w,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16 * w, vertical: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10 * w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/product.png',
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  'Futbolka Polo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  '241 000 so\'m',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                count == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8 * w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.indigo),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Text(
                                              'Savatga olish',
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 15 * w),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.grey),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count--;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  count.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15 * w),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count++;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16 * w, vertical: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10 * w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/product.png',
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  'Futbolka Polo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  '241 000 so\'m',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                count1 == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8 * w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.indigo),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Text(
                                              'Savatga olish',
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 15 * w),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.grey),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count1--;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  count1.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15 * w),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count1++;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16 * w, vertical: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10 * w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/product.png',
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  'Futbolka Polo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  '241 000 so\'m',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                count2 == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count2++;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8 * w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.indigo),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Text(
                                              'Savatga olish',
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 15 * w),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.grey),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count2--;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  count2.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15 * w),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count2++;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16 * w, vertical: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10 * w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/product.png',
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  'Futbolka Polo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  '241 000 so\'m',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                count3 == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count3++;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8 * w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.indigo),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Text(
                                              'Savatga olish',
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 15 * w),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.grey),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count3--;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  count3.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15 * w),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count3++;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16 * w, vertical: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10 * w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/product.png',
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  'Futbolka Polo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  '241 000 so\'m',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                count == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8 * w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.indigo),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Text(
                                              'Savatga olish',
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 15 * w),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.grey),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count--;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  count.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15 * w),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count++;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16 * w, vertical: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10 * w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/product.png',
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  'Futbolka Polo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                Text(
                                  '241 000 so\'m',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18 * w,
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * w,
                                ),
                                count == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8 * w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.indigo),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Text(
                                              'Savatga olish',
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 15 * w),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColor.grey),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count--;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  count.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15 * w),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count++;
                                                  });
                                                },
                                                child: Container(
                                                  color: Colors.indigo,
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                    SizedBox(
                      height: 16 * w,
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10 * w),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/product.png',
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Futbolka Polo',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '241 00\'m',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          const Spacer(),
                          count == 0? Container(
                            width: 130,
                            height: 33,
                            decoration: const BoxDecoration(
                                color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(10),
                              ),
                            ),
                            child: const Center(child: Text('Svatga olish',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),)),
                          ):
                          Container(
                            width: 130,
                            height: 33,
                            child: Row(
                              children: [
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.remove,color: Colors.white,),
                                ),),
                                Expanded(child: Container(

                                  child: Center(
                                    child: Text(count.toString(),style: TextStyle(color: Colors.black),),
                                  ),
                                ),),
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10 * w),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/product.png',
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Futbolka Polo',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '241 00\'m',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          const Spacer(),
                          count == 0? Container(
                            width: 130,
                            height: 33,
                            decoration: const BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: const Center(child: Text('Svatga olish',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),)),
                          ):
                          Container(
                            width: 130,
                            height: 33,
                            child: Row(
                              children: [
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.remove,color: Colors.white,),
                                ),),
                                Expanded(child: Container(

                                  child: Center(
                                    child: Text(count.toString(),style: TextStyle(color: Colors.black),),
                                  ),
                                ),),
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10 * w),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/product.png',
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Futbolka Polo',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '241 00\'m',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          const Spacer(),
                          count == 0? Container(
                            width: 130,
                            height: 33,
                            decoration: const BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: const Center(child: Text('Svatga olish',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),)),
                          ):
                          Container(
                            width: 130,
                            height: 33,
                            child: Row(
                              children: [
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.remove,color: Colors.white,),
                                ),),
                                Expanded(child: Container(

                                  child: Center(
                                    child: Text(count.toString(),style: TextStyle(color: Colors.black),),
                                  ),
                                ),),
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10 * w),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/product.png',
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Futbolka Polo',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '241 00\'m',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          const Spacer(),
                          count == 0? Container(
                            width: 130,
                            height: 33,
                            decoration: const BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: const Center(child: Text('Svatga olish',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),)),
                          ):
                          Container(
                            width: 130,
                            height: 33,
                            child: Row(
                              children: [
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.remove,color: Colors.white,),
                                ),),
                                Expanded(child: Container(

                                  child: Center(
                                    child: Text(count.toString(),style: TextStyle(color: Colors.black),),
                                  ),
                                ),),
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10 * w),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/product.png',
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Futbolka Polo',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '241 00\'m',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          const Spacer(),
                          count == 0? Container(
                            width: 130,
                            height: 33,
                            decoration: const BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: const Center(child: Text('Svatga olish',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),)),
                          ):
                          Container(
                            width: 130,
                            height: 33,
                            child: Row(
                              children: [
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.remove,color: Colors.white,),
                                ),),
                                Expanded(child: Container(

                                  child: Center(
                                    child: Text(count.toString(),style: TextStyle(color: Colors.black),),
                                  ),
                                ),),
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                        Border.all(color: Colors.black.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10 * w),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/product.png',
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Futbolka Polo',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '241 00\'m',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18 * w,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          const Spacer(),
                          count == 0? Container(
                            width: 130,
                            height: 33,
                            decoration: const BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: const Center(child: Text('Svatga olish',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),)),
                          ):
                          Container(
                            width: 130,
                            height: 33,
                            child: Row(
                              children: [
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.remove,color: Colors.white,),
                                ),),
                                Expanded(child: Container(

                                  child: Center(
                                    child: Text(count.toString(),style: TextStyle(color: Colors.black),),
                                  ),
                                ),),
                                Expanded(child: Container(
                                  color: Colors.indigo,
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),),
    );
  }
}
