//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soko_beauty/pages/public/splashscreen.dart';
import 'package:soko_beauty/theme/dark.dart';
import 'package:soko_beauty/theme/light.dart';
//import 'firebase_options.dart';
// async {
  //WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // Enable Firestore offline persistence
  // FirebaseFirestore.instance.settings = Settings(
  //   persistenceEnabled: true,
  // );
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Restrict the app to light theme
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
