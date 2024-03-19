import 'package:flutter/material.dart';
// import 'package:soko_beauty/models/shop/Product.dart';
import 'package:soko_beauty/shop/widgets/common/product_image_slider.dart';

class ProductDetailsPage extends StatelessWidget {
  // final Product product;
  // final List<Product> RelatedProducts;

  // const ProductDetailsPage({super.key, required this.product, required this.RelatedProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Product Details'),
            floating: false,
            pinned: true,
            actions: [
              // Add to cart icon
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Add to cart action
                },
              ),
            ],
           
          ),
          SliverList(delegate: 
          SliverChildListDelegate([
            CarouselWithDotsPage(),
          ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Description:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et libero non dolor mollis cursus.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price: Ksh 1000',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add to cart action
                            },
                            child: Text('Add to Cart'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Buy now action
                            },
                            child: Text('Buy Now'),
                          ),
                        ],
                      ),
                      //expandible widget for more details
                      ExpansionTile(
                        title: Text('More Details'),
                        children: [
                          ListTile(
                            title: Text('Category'),
                            subtitle: Text('Category Name'),
                          ),
                          ListTile(
                            title: Text('Brand'),
                            subtitle: Text('Brand Name'),
                          ),
                          ListTile(
                            title: Text('Color'),
                            subtitle: Text('Color Name'),
                          ),
                          ListTile(
                            title: Text('Size'),
                            subtitle: Text('Size Name'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //sliver for related products horizontal list
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Related Products',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Product Name',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Price: Ksh 1000',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add to cart action
                                    },
                                    child: Text('ADD TO CART'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
