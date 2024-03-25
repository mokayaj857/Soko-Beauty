import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/config/theme/themes/dark.dart';
import 'package:soko_beauty/config/theme/themes/light.dart';
import 'feautures/auth/views/services/user_provider.dart';
import 'firebase_options.dart';
import 'home/views/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Initialize Firebase
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Enable Firestore offline persistence
  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
  );
  runApp( 
     MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    Brightness brightness = Theme.of(context).brightness;

    Color systemNavigationBarColor =
        brightness == Brightness.dark ? Colors.black : Colors.white;
    Brightness statusBarIconBrightness =
        brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    Brightness statusBarBrightness =
        brightness == Brightness.dark ? Brightness.light : Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: brightness,
      systemNavigationBarColor: systemNavigationBarColor,
      statusBarIconBrightness: statusBarIconBrightness,
      statusBarBrightness: statusBarBrightness,
      systemStatusBarContrastEnforced: false,
    ));
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
