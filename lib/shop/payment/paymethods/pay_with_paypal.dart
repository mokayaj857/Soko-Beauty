import 'package:flutter/material.dart';

import '../../widgets/instruction_list_item.dart';

class PaypalPaymentScreen extends StatelessWidget {
  const PaypalPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Paypal',
            style: TextStyle(
              color: Colors.blue[800],
            ),
          ),
          foregroundColor: Colors.blue[800],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                children: [
                                  InstructionListItem(
                                      number: "1.",
                                      text:
                                          "Cross-check your details before initiating the PayPal payment."),
                                  InstructionListItem(
                                      number: "2.",
                                      text:
                                          "You will be redirected to the PayPal login page for authentication."),
                                  InstructionListItem(
                                      number: "3.",
                                      text:
                                          "Complete the payment by entering your PayPal credentials and confirming the transaction."),
                                  InstructionListItem(
                                      number: "4.",
                                      text:
                                          "You will receive a confirmation message once the PayPal transaction is successfully processed."),
                                ],
                              ),
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Enter Email Address',
                                  labelStyle: TextStyle(
                                    color: Colors.blue[800],
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
                                    fontSize: 18,
                                  ),
                                ),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 15)),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blue[800]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // Helper function to create a styled list item
}
