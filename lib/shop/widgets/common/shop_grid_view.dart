import 'package:flutter/material.dart';

class ShopGridView extends StatelessWidget {
  const ShopGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisExtent: 300,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: 10, // Set the number of cards you want to display
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.network(
                  "https://picsum.photos/400/200?random=$index",
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text('Product Name'),
                subtitle: Text('Price: \Ksh 1000'),
              ),
              ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('BUY'),
                    onPressed: () {/* Add your action here */},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
