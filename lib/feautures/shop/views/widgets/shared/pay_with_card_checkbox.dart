import 'package:flutter/material.dart';


class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool saveCardInfo = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: saveCardInfo,
          onChanged: (value) {
            setState(() {
              saveCardInfo = value!;
            });
          },
        ),
        Text('Save Card Info for Future Use?'),
      ],
    );
  }
}
