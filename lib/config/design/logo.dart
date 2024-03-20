import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/colors.dart';

class LogoDesign extends StatelessWidget {
  const LogoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [
            sbwarmRed,
            sbdarkBrown,
          ],
        ),
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Card(
              margin: EdgeInsets.all(40.0),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'SOKO\nBEAUTY',
                  style: TextStyle(
                    color: sbwarmRed,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
              'Everything Beauty.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
