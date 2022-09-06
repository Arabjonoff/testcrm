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
  Widget build(BuildContext context) => OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  _selectedIndex = index;
                  setState(() {});
                },
                currentIndex: _selectedIndex,
                selectedItemColor: AppColor.green,
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
              body: menu[_selectedIndex]
          );
        } else {
          return Row(
            children: [
              NavigationRail(
                elevation: 10,
                unselectedLabelTextStyle: const TextStyle(color: Colors.black),
                useIndicator: true,
                indicatorColor: Colors.indigo,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.all,
                backgroundColor: Colors.white,
                destinations: const <NavigationRailDestination>[
                  // navigation destinations
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text(
                      'Asosiy',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: Text(
                      'Savat',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_bag_outlined),
                    label: Text(
                      'Buyurtmalar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_outline),
                    label: Text(
                      'Profil',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
                selectedIconTheme: IconThemeData(color: Colors.white),
                unselectedIconTheme: IconThemeData(color: Colors.black),
                selectedLabelTextStyle: TextStyle(color: Colors.white),
              ),
              const VerticalDivider(thickness: 1, width: 2),
            Expanded(child:   menu[_selectedIndex])
            ],
          );
        }
      },
    );
}
