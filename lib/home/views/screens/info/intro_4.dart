import 'package:flutter/material.dart';

class IntroPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/gif/shop.gif',
                  width: 200,
                  height: 200,
                ),
                Text(
                  'Shop Online',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 20),
                // Subtitle
                Text(
                  'Buy and sell products and services online.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: 40),
                // Description
                Text(
                  'Create an account to buy and sell products and services online. Get the best deals on beauty products and services.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
