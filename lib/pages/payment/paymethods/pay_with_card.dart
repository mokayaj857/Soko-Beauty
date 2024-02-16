import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';

class CardPaymentScreen extends StatelessWidget {
  const CardPaymentScreen({super.key});

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
                      'Debit/Credit Card',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: sbwarmRed,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: sbpaygray,
                            ),
                            child: TabBar(
                              labelColor: sbwarmRed,
                              unselectedLabelColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              tabs: [
                                Tab(text: 'Debit Card'),
                                Tab(text: 'Credit Card'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100, // Height of the TabBarView
                            child: TabBarView(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Center(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Card Number',
                                      ),
                                    ),
                                  ),
                                ),
                                // Content for Credit Card Tab
                                Container(
                                  child: Center(
                                    child: Text('Credit Card Content'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],//
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
