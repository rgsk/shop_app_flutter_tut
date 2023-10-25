import 'package:flutter/material.dart';
import 'package:shop_app_flutter_tut/utils/global_variables.dart';
import 'package:uuid/uuid.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> cart = [];
  final _uuid = Uuid();
  void addProduct({
    required String productId,
    required int size,
    required int quantity,
  }) {
    final existingCartItemIndex = cart.indexWhere(
      (cartItem) => cartItem.productId == productId && cartItem.size == size,
    );
    if (existingCartItemIndex == -1) {
      cart.add(CartItem(
        id: _uuid.v4(),
        productId: productId,
        size: size,
        quantity: quantity,
      ));
    } else {
      cart[existingCartItemIndex].quantity += quantity;
    }

    notifyListeners();
  }

  void deleteCartItem(String cartItemId) {
    cart.removeWhere((cartItem) => cartItem.id == cartItemId);
    notifyListeners();
  }
}
