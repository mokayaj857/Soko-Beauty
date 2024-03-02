import 'package:flutter/material.dart';


class PaymentMethodWidget extends StatefulWidget {
  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<String>(
          value: selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              selectedPaymentMethod = value;
            });
          },
          hint: Text('Select Payment Method'),
          items: [
            DropdownMenuItem(
              child: Text('Visa'),
              value: 'Visa',
            ),
            DropdownMenuItem(
              child: Text('Mastercard'),
              value: 'Mastercard',
            ),
          ],
        ),
      ],
    );
  }
}
