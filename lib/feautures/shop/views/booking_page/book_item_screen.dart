import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_beauty/config/colors/colors.dart';
import 'package:soko_beauty/feautures/shop/views/widgets/service_item.dart';

class BookingPage extends StatefulWidget {
  final VoidCallback onBook;

  BookingPage({required this.onBook});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/200/300'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Salon Name',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(width: 10),
                            Icon(Icons.star,
                                color: Color.fromARGB(255, 221, 108, 3),
                                size: 14),
                            Text('4.5',
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ],
                        ),
                        // Text('Hair Stylist...'),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 12,
                            ),
                            Text('Kigali, Rwanda',
                                style: TextStyle(fontSize: 12))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Mon - Fri: 9am - 5pm'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.phone_circle_fill,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.mail_solid,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.location_solid,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          ServiceItem(
            services: [
              Service(
                  name: 'Braids',
                  price: '\$100',
                  imageUrl: 'https://picsum.photos/200'),
              Service(
                  name: 'Dreadlocks',
                  price: '\$200',
                  imageUrl: 'https://picsum.photos/200?2'),
              Service(
                  name: 'Box Braids',
                  price: '\$300',
                  imageUrl: 'https://picsum.photos/200?3'),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              widget.onBook();
            },
            child: SizedBox(
                width: double.infinity,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Book Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ))),
            style: ElevatedButton.styleFrom(
              backgroundColor: sbbrickRed,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
