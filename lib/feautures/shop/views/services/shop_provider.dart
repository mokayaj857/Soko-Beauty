// shop_provider.dart
import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/data/models/shop.dart';
import 'package:soko_beauty/feautures/shop/data/controllers/shop_controller.dart';

class ShopProvider with ChangeNotifier {
  final ShopController _shopController = ShopController();

  List<Shop> get shops => _shopController.shops;

  void addShop(Shop shop) {
    _shopController.addShop(shop);
    notifyListeners();
  }

  List<Shop> getShopsByOwner(String ownerId) {
    return _shopController.getShopsByOwner(ownerId);
  }

  List<Shop> searchShops(String query) {
    return _shopController.searchShops(query);
  }

  void updateShop(String id, Shop updatedShop) {
    _shopController.updateShop(id, updatedShop);
    notifyListeners();
  }

  void deleteShop(String id) {
    _shopController.deleteShop(id);
    notifyListeners();
  }
}
