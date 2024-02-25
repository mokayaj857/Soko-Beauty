import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:soko_beauty/models/shop/shop.dart';
import 'package:soko_beauty/theme/colors/colors.dart';
import 'package:soko_beauty/widgets/products/common/product_selection_chips.dart';

class ProductsAppbar extends StatelessWidget {
  final String shopName;
  final String shopDescription;

  const ProductsAppbar({
    Key? key,
    required this.shopName,
    required this.shopDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).cardColor.withOpacity(0.95),
      foregroundColor: sbbrickRed,
      pinned: true,
      expandedHeight: 300,
      collapsedHeight: 30,
      toolbarHeight: 0.0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: ProductSelectionChips(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/1080/920'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  color: Theme.of(context)
                      .bottomAppBarTheme
                      .color!
                      .withOpacity(0.1),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    shopName,
                    style: TextStyle(
                      color: sbbrickRed,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      shopDescription,
                      style: TextStyle(
                        color: sbbrickRed,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SafeArea(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 400),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                hintText: 'Search for Products',
                                prefixIcon: Icon(
                                  Icons.search_outlined,
                                  color: sbbrickRed,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                fillColor: Theme.of(context)
                                    .bottomAppBarTheme
                                    .color!
                                    .withOpacity(0.9),
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      titleSpacing: 0.0,
    );
  }
}

