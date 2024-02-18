import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:soko_beauty/colors/colors.dart';
import 'package:soko_beauty/widgets/shop/tabs/all_shops.dart';
import 'package:soko_beauty/widgets/shop/tabs/product_shops.dart';
import 'package:soko_beauty/widgets/shop/tabs/service_shops.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                title: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 0.0,
                  tabs: [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Services',
                    ),
                    Tab(
                      text: 'Products',
                    ),
                  ],
                ),
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
                            Text(
                              'Urembo Viganjani Mwako - Beauty at your fingertips',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
              leading: IconButton(
                onPressed: () {
                  // Handle back button tap
                },
                icon: Icon(
                  Icons.search_outlined,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    //navigate to settings page
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                  ),
                ),
              ],
            ),
             SliverFillRemaining(
          child: TabBarView(
            children: [
              AllShopsScreen(),
              ServiceShopsScreen(),
              ProductShopsScreen(),
            ],
          ),
          
             ),
          ],
        ),
      ),
    );
  }
}
