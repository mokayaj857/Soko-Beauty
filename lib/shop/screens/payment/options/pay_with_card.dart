import 'package:flutter/material.dart';
import 'package:soko_beauty/shop/screens/payment/options/saved_cards.dart';
import 'package:soko_beauty/shop/screens/payment/credit_card_screen.dart';
import 'package:soko_beauty/shop/screens/payment/debit_card_screen.dart';

class CardPaymentScreen extends StatelessWidget {
  const CardPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).bottomAppBarTheme.color,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Debit Card'),
                Tab(text: 'Credit Card'),
              ],
            ),
            title: Text('Card Payment'),
            actions: [
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                 // SavedCardsScreen()
                 Navigator.push(context, 
                 MaterialPageRoute(builder: (context) => SavedCardsScreen()));
                },
              ),
            
            ],
          ),
          body: TabBarView(
            children: [
              Expanded(child: DebitCardScreen()),
              Expanded(child: CreditCardScreen()),
            ],
          )),
    );
  }
}
