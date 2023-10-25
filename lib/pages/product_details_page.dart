import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter_tut/providers/cart_provider.dart';
import 'package:shop_app_flutter_tut/utils/app_colors.dart';
import 'package:shop_app_flutter_tut/utils/global_variables.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product.imageUrl),
          ),
          Spacer(flex: 2),
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              children: [
                Text(
                  '\$${widget.product.price}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product.sizes.length,
                    itemBuilder: (context, index) {
                      final size = widget.product.sizes[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (selectedSize != -1) {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addProduct(
                          productId: widget.product.id,
                          size: selectedSize,
                          quantity: 1,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Product added successfully!'),
                            duration: Duration(
                              seconds: 1,
                            ),
                          ),
                        );
                      } else {
                        // notify to select a size
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please select a Size!'),
                            duration: Duration(
                              seconds: 1,
                            ),
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(
                        double.infinity,
                        50,
                      ),
                    ),
                    label: Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
