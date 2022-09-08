import 'package:flutter/material.dart';
import 'package:testcrm/src/bloc/home/home_bloc.dart';
import 'package:testcrm/src/colors/colors.dart';
import 'package:testcrm/src/model/product_model/products_model.dart';
import 'package:testcrm/src/ui/detail/detail_screen.dart';
import 'package:testcrm/src/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _gridCount = 2;

  @override
  initState() {
    homeBloc.getAllProducts('002');
    super.initState();
  }

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
      body: StreamBuilder<ProductsModel>(
          stream: homeBloc.getProducts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> data = snapshot.data!.data;
              return ListView.builder(
                  itemCount: (data.length + _gridCount - 1) ~/ _gridCount,
                  itemBuilder: (context, index) {
                    return Column(
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
                                        return  DetailScreen(name: data[index*_gridCount].name, id: data[index*_gridCount].id,);
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
                                        margin: EdgeInsets.symmetric(
                                            vertical: 15 * w),
                                        width: 100 * w,
                                        child: Image.asset(
                                          'assets/icons/logo.png',
                                        ),
                                      ),
                                      Text(
                                        data[index * _gridCount].name,
                                        style: TextStyle(
                                            color: AppColor.green,
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
                              child: index * _gridCount + 1 >= data.length
                                  ? Container()
                                  : GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return  DetailScreen(name: data[index*_gridCount+1].name, id: data[index*_gridCount+1].id,);
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
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 15 * w),
                                              width: 100 * w,
                                              child: Image.asset(
                                                'assets/icons/logo.png',
                                              ),
                                            ),
                                            Text(
                                              data[index * _gridCount + 1].name,
                                              style: TextStyle(
                                                  color: AppColor.green,
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
                          ],
                        ),
                      ],
                    );
                  });
            }
            return  Stack(
              children: [
                Center(child: Image.asset('assets/icons/logo.png',width: 30,),),
            const Center(child: CircularProgressIndicator(color: AppColor.green,strokeWidth: 2,),),
              ],
            );
          }),
    );
  }
}
