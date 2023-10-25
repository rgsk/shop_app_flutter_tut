import 'package:flutter/material.dart';
import 'package:shop_app_flutter_tut/components/cart_page.dart';
import 'package:shop_app_flutter_tut/components/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  var pages = [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // IndexedStack allows us to maintain the
        // scroll position when moving across the pages
        child: IndexedStack(
          index: currentPageIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
