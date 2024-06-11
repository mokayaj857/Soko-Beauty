import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/core/constants/cloudinary_constants.dart';
import 'package:soko_beauty/feautures/video/views/services/reaction_provider.dart';
import 'package:soko_beauty/feautures/video/views/services/video_provider.dart';
import 'core/views/services/theme_provider.dart';
import 'feautures/auth/views/services/user_provider.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'core/utils/firebase_options.dart';
import 'landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // initialize cloudinary
  Cloudinary cloudinary = CloudinaryObject.fromCloudName(cloudName: cloudName);
  cloudinary.config.urlConfig.secure = true;

  // Initialize Firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Enable Firestore offline persistence
  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => VideoProvider()),
    ChangeNotifierProvider(create: (context) => ReactionProvider()),
  ], child: SokoBeauty()));
}

class SokoBeauty extends StatelessWidget {
  const SokoBeauty({super.key});
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
      systemNavigationBarDividerColor:
          themeProvider.themeData.scaffoldBackgroundColor,
      statusBarIconBrightness:
          themeProvider.themeData.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
      statusBarBrightness: themeProvider.themeData.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ));
    return MaterialApp(
      theme: themeProvider.themeData,
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.easeInOut,
      themeAnimationDuration: const Duration(milliseconds: 300),
    );
  }
}
