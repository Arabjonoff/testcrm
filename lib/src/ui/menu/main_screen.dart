import 'package:flutter/material.dart';
import 'package:testcrm/src/colors/colors.dart';
import 'package:testcrm/src/ui/menu/cart/cart_screen.dart';
import 'package:testcrm/src/ui/menu/home/home_screen.dart';
import 'package:testcrm/src/ui/menu/order/order_screen.dart';
import 'package:testcrm/src/ui/menu/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> menu = [
    const HomeScreen(),
    CartScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        backgroundColor: AppColor.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13,

        unselectedFontSize: 13,
        elevation: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Asosiy'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: 'Savat'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'Buyurtmalar'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'Profil'),
        ],
      ),
      body: menu[_selectedIndex],
    );
  }
}
