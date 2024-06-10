import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';

class UserController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new user document in the users collection
  Future<void> createUser(UserModel user) async {
    await _firestore.collection('users').doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String userId) async {
    final docSnapshot = await _firestore.collection('users').doc(userId).get();
    if (docSnapshot.exists) {
      return UserModel.fromDocument(docSnapshot);
    } else {
      return null;
    }
  }

  Future<void> updateUser(String userId, Map<String, dynamic> updates) async {
    await _firestore.collection('users').doc(userId).update(updates);
  }

  Future<void> deleteUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

  //method to follow a user or unfollow a user using boolean
  Future<bool> followUser( String userId, String followedUserId, bool follow) async {
    if (follow) {
      await _firestore.collection('users').doc(userId).update({
        'following': FieldValue.arrayUnion([followedUserId])
      });
      await _firestore.collection('users').doc(followedUserId).update({
        'followers': FieldValue.arrayUnion([userId])
      });
      return true;
    } else {
      await _firestore.collection('users').doc(userId).update({
        'following': FieldValue.arrayRemove([followedUserId])
      });
      await _firestore.collection('users').doc(followedUserId).update({
        'followers': FieldValue.arrayRemove([userId])
      });
      return true;
    }
    // return false;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
