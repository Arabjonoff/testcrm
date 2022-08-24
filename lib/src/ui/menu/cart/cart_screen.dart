import 'package:flutter/material.dart';
import 'package:testcrm/src/colors/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: 9,
              itemBuilder: (context,index){
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: AppColor.white),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 90,
                    child: Image.asset(
                      'assets/icons/product.png',
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Row(
                        children: [
                          const Text('Futbolka Polo',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          const Spacer(),
                          IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                        ],
                      ),
                      Row(
                        children: [
                          const Text('134 000 so\'m',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.indigo),),
                          const Spacer(),
                          Container(
                            width: 120,
                            color: AppColor.grey,
                            child: Row(
                              children: [
                                Expanded(child: Container(
                                    color: Colors.indigo,
                                    child: const Icon(Icons.remove,color: AppColor.white,)),),
                                const Expanded(child: Center(child: Text('122'))),
                                Expanded(child: Container(
                                    color: Colors.indigo,
                                    child: Icon(Icons.add,color: AppColor.white,)),),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8,),
                        ],
                      )
                    ],
                  ),),
                ],
              ),
            );
          }),),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.white,
            child: Column(
              children: [
                const SizedBox(height: 8,),
                Row(
                  children: const [
                    SizedBox(width: 16,),
                    Text('Umumiy narxi',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                    Spacer(),
                    Text('131 000 so\'m',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                    SizedBox(width: 16,),
                  ],
                ),
                const SizedBox(height: 8,),
                Row(
                  children: const [
                    SizedBox(width: 16,),
                    Text('Tovalar soni',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                    Spacer(),
                    Text('9 dona',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                    SizedBox(width: 16,),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 57,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo,
                  ),
                  child: const Center(child: Text('Serverga yuborish',style: TextStyle(color: AppColor.white,fontSize: 18,fontWeight: FontWeight.w700),)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
