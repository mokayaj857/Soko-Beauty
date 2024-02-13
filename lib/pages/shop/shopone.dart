import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/splashscreen.dart';

class shopOne extends StatelessWidget {
  const shopOne({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(left: 20), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, 
                children: [
                  Padding(
                    padding: 
                    const EdgeInsets.only(right: 0), 
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50,
                      color: sbbrickRed,
                    ),
                  ),
                  SizedBox(width: 89), 
                  Text(
                    "SHOP",
                    style: TextStyle(
                      color: sbbrickRed,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    
  }
}