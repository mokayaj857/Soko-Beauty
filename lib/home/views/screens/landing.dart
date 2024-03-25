import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soko_beauty/feautures/auth/data/models/user_model.dart';
import 'package:soko_beauty/feautures/auth/views/screens/add_info.dart';
import 'package:soko_beauty/feautures/auth/views/services/user_provider.dart';
import 'package:soko_beauty/home/views/screens/home_page.dart';
import 'package:soko_beauty/home/views/screens/splashscreen.dart';

import 'onboarding.dart';

class LandingPage extends StatelessWidget {
  void getUserData(User user, UserProvider userProvider) async {
    await userProvider.getUser(userId: user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Still waiting for authentication state
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data != null) {
                // User is authenticated, fetch user data
                final user = snapshot.data!;
                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);
                getUserData(user, userProvider);

                return StreamBuilder<UserModel?>(
                  stream: userProvider.userStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Waiting for user data stream to emit
                      return SplashScreen();
                      // return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData && snapshot.data != null) {
                      // User data is available, navigate to HomePage
                      return HomePage();
                    } else {
                      // User data is not available yet
                      return AddAccountInfo(user: user);
                    }
                  },
                );
              } else {
                // User is not authenticated, navigate to OnboardingPage
                return OnboardingPage();
              }
            },
          ),
        ],
      ),
    );
  }
}
