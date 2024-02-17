import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/payment/paymethods/pay_with_card.dart';
import 'package:soko_beauty/pages/payment/paymethods/pay_with_mpesa.dart';
import 'package:soko_beauty/pages/payment/paymethods/pay_with_paypal.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',  
          style: TextStyle(
            color: Colors.transparent,
          ),
        ),
      ),
        backgroundColor: Colors.transparent,
      
        body: SingleChildScrollView(
          child: Stack(
            
            children: [
              Image.network(
                'https://picsum.photos/980/1080?random=girl',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),

              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: Theme.of(context).canvasColor.withOpacity(0.2),
                  ),
                ),
              ),
              SizedBox(

                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Choose Payment Option',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: sbwarmRed,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 15),
                            Card(
                              color: sbpaygray,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                leading: Icon(Icons.credit_card),
                                title: Text(
                                  'Debit Card/Credit Card',
                                  style: TextStyle(
                                    color: sbwarmRed,
                                    fontSize: 16,
                                  ),
                                ),
                                onTap: () {
                                  // Handle selection
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => CardPaymentScreen()),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            Card(
                              color: sbpaygray,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                leading: Icon(Icons.paypal),
                                title: Text(
                                  'Paypal',
                                  style: TextStyle(
                                      color: Colors.blue[900], fontSize: 16),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PaypalPaymentScreen()),
                                  );
                                  // Handle selection
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            Card(
                              color: sbpaygray,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                leading: Icon(Icons.monetization_on),
                                title: Text(
                                  'M-Pesa',
                                  style: TextStyle(
                                      color: Colors.green[800], fontSize: 16),
                                ),
                                onTap: () {
                                  // Handle selection
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => MpesaPaymentScreen()),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 5),
                            Card(
                              color: sbpaygray,
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8),
                                leading: Icon(Icons.add),
                                title: Text(
                                  'Add Another Payment Method',
                                  style: TextStyle(color: sbwarmRed, fontSize: 16),
                                ),
                                onTap: () {
                                  // Handle selection
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
