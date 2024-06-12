import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    print('Firebase token: $token');

    FirebaseMessaging.onMessage.listen((message) {
      print('Received message: $message');
    });
  }
}
