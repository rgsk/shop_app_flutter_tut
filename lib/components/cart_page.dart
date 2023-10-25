import 'package:flutter/material.dart';
import 'package:shop_app_flutter_tut/global_variables.dart';
import 'package:shop_app_flutter_tut/product_details_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {}),
            title: Text(
              product.title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size ${cartItem.size}'),
          );
        },
      ),
    );
  }
}
