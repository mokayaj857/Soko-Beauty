import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/pages/shop/all_shops.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor:
                Theme.of(context).bottomAppBarTheme.color!.withOpacity(0.7),
            foregroundColor: sbbrickRed,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              centerTitle: true,
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
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      color: Theme.of(context)
                          .bottomAppBarTheme
                          .color!
                          .withOpacity(0.8),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Soko Beauty Market',
                            style: TextStyle(
                              color: sbbrickRed,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                ),
              ),
            ],
          ),
          SliverFillRemaining(
            child: AllShopsScreen(),
          ),
        ],
      ),
    );
  }
}
