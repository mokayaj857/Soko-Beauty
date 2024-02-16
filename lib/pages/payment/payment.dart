import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/payment/paymethods/pay_with_card.dart';
import 'package:soko_beauty/pages/payment/paymethods/pay_with_mpesa.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 350,
            width: 452,
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
          ),
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
                          style: TextStyle(color: Colors.blue[900], fontSize: 16),
                        ),
                        onTap: () {
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
                          style: TextStyle(color: Colors.green[800], fontSize: 16),
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
        ],
      ),
    )
    );
  }
}
