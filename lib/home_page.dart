import 'package:flutter/material.dart';
import 'package:shop_app_flutter_tut/app_colors.dart';
import 'package:shop_app_flutter_tut/components/category.dart';
import 'package:shop_app_flutter_tut/components/product_card.dart';
import 'package:shop_app_flutter_tut/global_variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(122, 122, 122, 0.5),
        // color: Colors.red,
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Category(
                      filter: filter,
                      active: selectedFilter == filter,
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Column(
                      children: [
                        ProductCard(
                          product: product,
                          backgroundColor: index.isEven
                              ? AppColors.blue
                              : AppColors.lightBlue,
                        ),
                        if (index != products.length - 1)
                          SizedBox(
                            height: 40,
                          ),
                      ],
                    );
                  },
                  itemCount: products.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
