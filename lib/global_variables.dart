class Product {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String company;
  final List<int> sizes;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.company,
    required this.sizes,
  });
}

final products = [
  Product(
    id: '0',
    title: 'Men\'s Nike Shoes',
    price: 44.52,
    imageUrl: 'assets/images/shoes_1.png',
    company: 'Nike',
    sizes: [9, 10, 11, 12],
  ),
  Product(
    id: '1',
    title: 'Addidas Shoes',
    price: 20.12,
    imageUrl: 'assets/images/shoes_2.png',
    company: 'Addidas',
    sizes: [9, 10, 12],
  ),
  Product(
    id: '2',
    title: 'Bata Women\'s Shoes',
    price: 28.95,
    imageUrl: 'assets/images/shoes_3.png',
    company: 'Bata',
    sizes: [8, 9, 10],
  ),
  Product(
    id: '3',
    title: 'Jordan Shoes',
    price: 420.69,
    imageUrl: 'assets/images/shoes_4.png',
    company: 'Nike',
    sizes: [8, 9, 10],
  ),
];

class CartItem {
  final String id;
  final String productId;
  final int size;
  final int quantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.size,
    required this.quantity,
  });

  // Add a property to fetch the product from the products array.
  Product get product {
    return products.firstWhere((product) => product.id == productId,
        orElse: () => Product(
              id: 'Not Found',
              title: 'Product Not Found',
              price: 0.0,
              imageUrl: 'assets/images/placeholder.png',
              company: 'Unknown',
              sizes: [],
            ));
  }
}

final cart = [
  CartItem(
    id: '1',
    productId: products[0].id,
    size: products[0].sizes[0],
    quantity: 1,
  ),
];
