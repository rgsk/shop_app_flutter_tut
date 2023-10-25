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
  Product(
    id: '4',
    title: 'Puma Running Shoes',
    price: 54.99,
    imageUrl: 'assets/images/shoes_1.png',
    company: 'Puma',
    sizes: [7, 8, 9, 10, 11],
  ),
  Product(
    id: '5',
    title: 'Reebok Classic Sneakers',
    price: 39.95,
    imageUrl: 'assets/images/shoes_2.png',
    company: 'Reebok',
    sizes: [8, 9, 10, 11],
  ),
  Product(
    id: '6',
    title: 'New Balance Athletic Shoes',
    price: 65.25,
    imageUrl: 'assets/images/shoes_3.png',
    company: 'New Balance',
    sizes: [7, 8, 9, 10],
  ),
  Product(
    id: '7',
    title: 'Converse Canvas Sneakers',
    price: 32.99,
    imageUrl: 'assets/images/shoes_4.png',
    company: 'Converse',
    sizes: [6, 7, 8, 9, 10, 11],
  ),
  Product(
    id: '8',
    title: 'Vans Skate Shoes',
    price: 45.75,
    imageUrl: 'assets/images/shoes_1.png',
    company: 'Vans',
    sizes: [7, 8, 9, 10, 11],
  ),
  Product(
    id: '9',
    title: 'Adidas Ultra Boost',
    price: 59.99,
    imageUrl: 'assets/images/shoes_2.png',
    company: 'Adidas',
    sizes: [8, 9, 10, 11, 12],
  ),
  Product(
    id: '10',
    title: 'Skechers Running Shoes',
    price: 29.99,
    imageUrl: 'assets/images/shoes_3.png',
    company: 'Skechers',
    sizes: [7, 8, 9, 10],
  ),
  Product(
    id: '11',
    title: 'Under Armour Training Shoes',
    price: 38.50,
    imageUrl: 'assets/images/shoes_4.png',
    company: 'Under Armour',
    sizes: [8, 9, 10],
  ),
  Product(
    id: '12',
    title: 'Salomon Hiking Boots',
    price: 74.95,
    imageUrl: 'assets/images/shoes_1.png',
    company: 'Salomon',
    sizes: [7, 8, 9, 10, 11],
  ),
  Product(
    id: '13',
    title: 'Fila Tennis Shoes',
    price: 27.99,
    imageUrl: 'assets/images/shoes_2.png',
    company: 'Fila',
    sizes: [8, 9, 10, 11],
  ),
  Product(
    id: '14',
    title: 'Mizuno Running Shoes',
    price: 56.00,
    imageUrl: 'assets/images/shoes_3.png',
    company: 'Mizuno',
    sizes: [7, 8, 9, 10],
  ),
  Product(
    id: '15',
    title: 'Puma Suede Classic',
    price: 34.75,
    imageUrl: 'assets/images/shoes_4.png',
    company: 'Puma',
    sizes: [8, 9, 10, 11],
  ),
  Product(
    id: '16',
    title: 'Brooks Running Shoes',
    price: 61.99,
    imageUrl: 'assets/images/shoes_1.png',
    company: 'Brooks',
    sizes: [7, 8, 9, 10],
  ),
  Product(
    id: '17',
    title: 'Asics Gel-Kayano',
    price: 49.99,
    imageUrl: 'assets/images/shoes_2.png',
    company: 'Asics',
    sizes: [8, 9, 10, 11, 12],
  ),
  Product(
    id: '18',
    title: 'Sketchers Memory Foam',
    price: 39.99,
    imageUrl: 'assets/images/shoes_3.png',
    company: 'Skechers',
    sizes: [8, 9, 10, 11],
  )
];

class CartItem {
  final String id;
  final String productId;
  final int size;
  int quantity;

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
