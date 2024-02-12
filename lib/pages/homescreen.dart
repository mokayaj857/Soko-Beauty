import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 926,
        padding: const EdgeInsets.only(top: 847),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 430,
              height: 79,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 430,
                    height: 79,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 348,
                    height: 73,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 94,
                          top: 61,
                          child: SizedBox(
                            width: 55,
                            child: Text(
                              'SHOP',
                              style: TextStyle(
                                color: Color(0xFFF5F5F5),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 199,
                          top: 9,
                          child: Container(
                            width: 45,
                            height: 45,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: -12,
                                  top: 52,
                                  child: SizedBox(
                                    width: 88,
                                    height: 49,
                                    child: Text(
                                      'ACCOUNT',
                                      style: TextStyle(
                                        color: Color(0xFFF5F5F5),
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: -11,
                          top: 61,
                          child: Container(
                            width: 55,
                            height: 49,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                SizedBox(
                                  width: 55,
                                  height: 49,
                                  child: Text(
                                    'HOME',
                                    style: TextStyle(
                                      color: Color(0xFFA00000),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 55,
                    height: 30,
                    child: Text(
                      'MORE\n',
                      style: TextStyle(
                        color: Color(0xFFF5F5F5),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: Icons.abc_sharp),
      //   BottomNavigationBarItem(icon: )

      // ],),
    );
  }
}
