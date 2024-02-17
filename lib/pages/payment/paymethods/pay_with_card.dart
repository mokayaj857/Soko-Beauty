import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/widgets/payment/pay_with_card_checkbox.dart';
import 'package:soko_beauty/widgets/payment/pay_with_card_merchants.dart';

class CardPaymentScreen extends StatelessWidget {
  const CardPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
          
            bottom: TabBar(
              padding: EdgeInsets.only(top: 30.0),
              tabs: [
                Tab(text: 'Debit Card'),
                Tab(text: 'Credit Card'),
              ],
            ),
            title: Text('Card Payment'),
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
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height, // Height of the TabBarView
                            child: TabBarView(
                              children: [
                                // Content for Debit Card Tab
                                SingleChildScrollView(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Card Number',
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Name on Card',
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Expiry Date',
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Expanded(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'CVV',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        PaymentMethodWidget(),

                                        SizedBox(height: 20),
                                        CheckboxWidget(),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Pay',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        sbwarmRed),
                                              ),
                                            ),
                                            SizedBox(width: 190),
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: Text('Cancel'),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        sbpaygray),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Content for Credit Card Tab
                                SingleChildScrollView(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Card Number',
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Name on Card',
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Expiry Date',
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Expanded(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'CVV',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        PaymentMethodWidget(),

                                         SizedBox(height: 20),
                                        CheckboxWidget(),

                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Pay',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        sbwarmRed),
                                              ),
                                            ),
                                            SizedBox(width: 190),
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: Text('Cancel'),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        sbpaygray),
                                              ),
                                            ),
                                          ],
                                        ),
                                       
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ], //
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
