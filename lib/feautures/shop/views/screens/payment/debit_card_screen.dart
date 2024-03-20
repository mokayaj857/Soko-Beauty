import 'package:flutter/material.dart';

import 'package:soko_beauty/config/colors/colors.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/shared/pay_with_card_checkbox.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/shared/pay_with_card_merchants.dart';


class DebitCardScreen extends StatelessWidget {
  const DebitCardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 500),
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
                    labelText: 'Full Name',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expiry Date',
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Pay',
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(sbwarmRed),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
