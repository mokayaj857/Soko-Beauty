import 'package:flutter/material.dart';
import 'package:soko_beauty/pages/payment/paymethods/saved_cards.dart';
import 'package:soko_beauty/widgets/payment/credit_card_screen.dart';
import 'package:soko_beauty/widgets/payment/debit_card_screen.dart';

class CardPaymentScreen extends StatelessWidget {
  const CardPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
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
