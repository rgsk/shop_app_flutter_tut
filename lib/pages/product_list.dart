import 'package:flutter/material.dart';
import 'package:shop_app_flutter_tut/utils/app_colors.dart';
import 'package:shop_app_flutter_tut/utils/breakpoints.dart';
import 'package:shop_app_flutter_tut/utils/global_variables.dart';
import 'package:shop_app_flutter_tut/widgets/category.dart';
import 'package:shop_app_flutter_tut/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    // below is more efficient
    final size = MediaQuery.sizeOf(context);

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
                    size.width >= Breakpoints.md
                        ? 'Shoes Collection'
                        : 'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (size.width >= Breakpoints.md) Spacer(),
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
                shrinkWrap: true,
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
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.5,

                        // size.width >= Breakpoints.xl can also be used
                        crossAxisCount: constraints.maxWidth >= Breakpoints.xl
                            ? 4
                            : constraints.maxWidth >= Breakpoints.lg
                                ? 3
                                : constraints.maxWidth >= Breakpoints.md
                                    ? 2
                                    : 1,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          product: product,
                          backgroundColor: index.isEven
                              ? AppColors.blue
                              : AppColors.lightBlue,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
