import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/core/constants/app_colors.dart';
import 'package:mystore/presentation/cart/cart_screen/cart_screen.dart';
import 'package:mystore/presentation/home/home_screen/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
  HomeScreen(userName: '',),
    CartScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart),label: 'Cart'),

      ],

        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.red,
        onTap: _onItemTapped,
      ),

    );
  }
}
