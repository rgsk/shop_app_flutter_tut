import 'package:flutter/material.dart';
import 'package:shop_app_flutter_tut/pages/product_details_page.dart';
import 'package:shop_app_flutter_tut/utils/global_variables.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Color backgroundColor;
  const ProductCard(
      {super.key, required this.product, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ProductDetailsPage(
              product: product,
            );
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    product.imageUrl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
