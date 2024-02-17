import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';

class MpesaPaymentScreen extends StatelessWidget {
  const MpesaPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mpesa Payment',
        style: TextStyle(
          color: Colors.green[800],       
        ),
        ),
        foregroundColor: Colors.green[800],
        
      ),
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    
                    Card(
                      margin: EdgeInsets.all(20),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                                "-Cross-check your details before pressing the button below.\n -You will receive a prompt on your phone to enter your pin.\n -You will receive a confirmation message once the transaction is complete.",
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18,
                                )),
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter Phone Number',
                                labelStyle: TextStyle(
                                  color: Colors.green[800],
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                            
                              onPressed: () {},
                              child: Text(
                                'Pay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green[800]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
