import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:testcrm/src/bloc/cart_bloc/cart_bloc.dart';
import 'package:testcrm/src/colors/colors.dart';
import 'package:testcrm/src/model/http_result.dart';
import 'package:testcrm/src/model/product_model/product_detail_model/product_detail.dart';
import 'package:testcrm/src/model/send_order/send_order_model.dart';
import 'package:testcrm/src/repository/repository.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  initState() {
    cartBloc.allCart();
    super.initState();
  }

  double prices = 0;

  final Repository _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: AppColor.grey,
        elevation: 1,
        title: const Text('Savat'),
      ),
      body: StreamBuilder<List<DetailResult>>(
          stream: cartBloc.getCard,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              double price = 0;
              for (int i = 0; i < snapshot.data!.length; i++) {
                price += (snapshot.data![i].snarhi * snapshot.data![i].count);
              }
              List<DetailResult> data = snapshot.data!;
              return data.isEmpty?Center(
                child: Image.asset(
                  'assets/icons/box.png',
                  color: AppColor.orange,
                  width: 65,
                ),
              ):Column(
                children: [
                  Expanded(
                      child:ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return FadeInRight(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.white),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                data[index].name,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                  onPressed: () {
                                                    cartBloc.deleteProductCard(
                                                        data[index].id);
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete_forever_outlined,
                                                    color: AppColor.orange,
                                                  ))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                data[index].narhi.toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.orange),
                                              ),
                                              const Spacer(),
                                              Container(
                                                width: 130,
                                                decoration: BoxDecoration(
                                                    color: AppColor.white,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        50)),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: AppColor.green,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                50)),
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color: AppColor.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          data[index]
                                                              .count.toInt().toString(),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          cartBloc.updateCart(
                                                              data[index], false);
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                              AppColor.green,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  50)),
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
                                              const SizedBox(
                                                width: 8,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),

                  ),
                  Container(
                    color: AppColor.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Umumiy narxi',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            const Spacer(),
                            Text(
                              '${price.toInt()} so\'m',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColor.orange),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 16,
                            ),
                            const Text(
                              'Tovalar soni',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            const Spacer(),
                            Text(
                              '${snapshot.data!.length} dona',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColor.orange),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async{
                            List<Tzakaz1> p = [];
                            for (int i = 0; i < data.length; i++) {
                              Tzakaz1 tzakaz1 = Tzakaz1(
                                name: data[i].name,
                                idSkl2: data[i].idSkl2,
                                soni: data[i].soni,
                                narhi: data[i].narhi,
                                snarh: data[i].snarhi,
                                sm: price.toInt(),
                              );
                              p.add(tzakaz1);
                            }
                            OrderModel send = OrderModel(
                              data: [
                                OrderResult(
                                  id: 0,
                                  name: 'name',
                                  ndoc: 'ndoc',
                                  idToch: '001',
                                  izoh: 'izoh',
                                  dt: DateTime.now(),
                                  sm: price,
                                  tzakaz1: p,
                                ),
                              ],
                            );
                            HttpResult result = await _repository.orderProducts(send);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 57,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.green,
                            ),
                            child: const Center(
                                child: Text(
                                  'Buyurtma berish',
                                  style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }return Container();
          }
      ),
    );
  }

  senData() async {
    List<Tzakaz1> p = [];
    for (int i = 0; i < 1; i++) {
      Tzakaz1 tzakaz1 = Tzakaz1(
        name: 'name',
        idSkl2: 1,
        soni: 2,
        narhi: 1221,
        snarh: 11,
        sm: 111,
      );
      p.add(tzakaz1);
    }
    OrderModel send = OrderModel(
      data: [
        OrderResult(
          id: 1,
          name: 'name',
          ndoc: 'ndoc',
          idToch: '1',
          izoh: 'izoh',
          dt: DateTime.now(),
          sm: 11,
          tzakaz1: p,
        ),
      ],
    );
    HttpResult result = await _repository.orderProducts(send);
  }
}
