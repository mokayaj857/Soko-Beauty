import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/shop/views/booking_page/book_item_screen.dart';
import 'package:soko_beauty/feautures/shop/views/booking_page/booking_calendar.dart';

class BookingWidget extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingWidget> {
  bool isBooking = false;

  void toggleBooking(bool value) {
    setState(() {
      isBooking = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        leading: isBooking
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  toggleBooking(false);
                },
              )
            : null,
        title: Text(
          isBooking ? 'Select Date & Time' : 'Book Service',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: isBooking
          ? BookingCalendarWidget(
              onBack: () {
                toggleBooking(false);
              },
            )
          : BookingPage(
              onBook: () {
                toggleBooking(true);
              },
            ),
    );
  }
}
