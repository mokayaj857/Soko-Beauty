import 'package:flutter/material.dart';
import 'package:soko_beauty/models/dummy_data/shop.dart';
import 'package:soko_beauty/pages/shop/view_all.dart';

class ShopListTitle extends StatelessWidget {
  const ShopListTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Spacer(),
          GestureDetector(
            onTap: () {
              // Navigate to view all
              //ViewAllShopsScreen();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllShopsScreen(shops: shops)));
            },
            child: Text("View All",
                style: TextStyle(
                  color: Colors.blue,
                )),
          ),
        ],
      ),
    );
  }
}
