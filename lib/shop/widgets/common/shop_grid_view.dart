import 'package:flutter/material.dart';
import 'package:soko_beauty/shop/screens/view_product.dart';

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
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(),
              ),
            );
          },
          child: Card(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Price: Ksh 1000',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    /* Add your action here */
                  },
                  child: Text('ADD TO CART'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
