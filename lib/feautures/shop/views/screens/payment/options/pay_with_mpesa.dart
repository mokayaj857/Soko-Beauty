import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/shared/instruction_list_item.dart';

class MpesaPaymentScreen extends StatelessWidget {
  const MpesaPaymentScreen({super.key});

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
            'Mpesa Payment',
            style: TextStyle(
              color: Colors.green[800],
            ),
          ),
          foregroundColor: Colors.green[800],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  InstructionListItem(
                                      number: "1.",
                                      text:
                                          "Cross-check your details before pressing the button below."),
                                  InstructionListItem(
                                      number: "2.",
                                      text:
                                          "You will receive a prompt on your phone to enter your pin."),
                                  InstructionListItem(
                                      number: "3.",
                                      text:
                                          "You will receive a confirmation message once the transaction is complete."),
                                ],
                              ),
                              Text("",
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
                                    //color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(
                                    EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 40,
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                      Colors.green[800]),
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
          ),
        ));
  }
}
