import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:soko_beauty/feautures/shop/data/models/shop.dart';

class ShopController {
  final CollectionReference _shopCollection =
      FirebaseFirestore.instance.collection('shops');

  Future<void> createShop(Shop shop) async {
    await _shopCollection.add(shop.toMap());
  }

  Future<void> updateShop(Shop shop) async {
    await _shopCollection.doc(shop.id).update(shop.toMap());
  }

  Future<void> deleteShop(String id) async {
    await _shopCollection.doc(id).delete();
  }

  Future<Shop> getShopById(String id) async {
    DocumentSnapshot doc = await _shopCollection.doc(id).get();
    return Shop.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<List<Shop>> getShopsByOwnerId(String ownerId) async {
    QuerySnapshot querySnapshot = await _shopCollection
        .where('ownerId', isEqualTo: ownerId)
        .get();
    return querySnapshot.docs
        .map((doc) => Shop.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<List<Shop>> searchShops(String query) async {
    QuerySnapshot querySnapshot = await _shopCollection
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .get();
    return querySnapshot.docs
        .map((doc) => Shop.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<List<Shop>> getAllShops() async {
    QuerySnapshot querySnapshot = await _shopCollection.get();
    return querySnapshot.docs
        .map((doc) => Shop.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
