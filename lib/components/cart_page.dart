import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter_tut/cart_provider.dart';
import 'package:shop_app_flutter_tut/product_details_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          final product = cartItem.product;
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ProductDetailsPage(
                    product: product,
                  );
                },
              ));
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                product.imageUrl,
              ),
              radius: 30,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                    context: context,

                    // barrier dismissible doesn't allows user to exist on clicking outside
                    // barrierDismissible: false,

                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete Product',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: Text(
                          'Are you sure you want to remove the product from you cart?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(
                                context,
                                listen: false,
                              ).deleteCartItem(cartItem.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Product removed successfully!'),
                                  duration: Duration(
                                    seconds: 1,
                                  ),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
            title: Text(
              product.title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Qty: ${cartItem.quantity}, Size: ${cartItem.size}'),
          );
        },
      ),
    );
  }
}
