import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/home/views/screens/landing/splashscreen.dart';
import 'core/services/theme_provider.dart';
import 'feautures/auth/views/services/user_provider.dart';
import 'firebase_options.dart';

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
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          themeProvider.themeData.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
      systemNavigationBarColor: themeProvider.themeData.scaffoldBackgroundColor,
      statusBarIconBrightness:
          themeProvider.themeData.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
      statusBarBrightness: themeProvider.themeData.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      systemStatusBarContrastEnforced: false,
      systemNavigationBarDividerColor: themeProvider.themeData.scaffoldBackgroundColor,
    ));
    return MaterialApp(
      theme: themeProvider.themeData,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.easeInOut,
      themeAnimationDuration: const Duration(milliseconds: 500),
    );
  }
}
