import 'package:flutter/material.dart';

class ShowDialog{
  static void showMessageDialog(
      BuildContext context,
      String msg
      ){
    showDialog(context: context, builder: (context){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Text(
                    'Xatolik',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18 ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    msg,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                     Navigator.pop(context);
                    },
                    child: const Text(
                      'ok',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}