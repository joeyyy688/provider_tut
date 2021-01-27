import 'package:flutter/foundation.dart';

import 'item.dart';

class CartModel extends ChangeNotifier{

  final List<Item> _cart = [];


  List<Item> get cart => _cart;

  void removeFromCart(Item item){
    _cart.remove(item);
    notifyListeners();
  }
  void removeFromCartByIndex(int index){
    _cart.removeAt(index);
    notifyListeners();
  }


  void addToCart(Item item){
    _cart.add(item);
    notifyListeners();
  }

  int getNoOfItems(){
    return _cart.length;
  }

  double getCartPriceSum(){
    double sum = 0;
    _cart.forEach((item) {
      sum += item.price;
    });
    return sum;
  }
  bool isItemInCart(Item item){
    return _cart.contains(item);
  }

  Item getItem(int index){
    return _cart[index];
  }
}