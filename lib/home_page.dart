import 'package:flutter/material.dart';
import 'package:shopping_app/cart_page.dart';
import 'package:shopping_app/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = [ProductPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index:currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage=value;
          });
        },
        currentIndex: currentPage,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
       BottomNavigationBarItem(icon: Icon(Icons.home),
       label: '',
       ),
       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
       label: '',
       ),
        ],
      ),
    );
  }
}
