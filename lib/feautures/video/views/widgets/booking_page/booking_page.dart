import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/video/views/widgets/booking_page/booking_calendar.dart';
import 'package:soko_beauty/feautures/video/views/widgets/booking_page/image_caraousel.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 400,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.grey[200],
                    child: ImageCarousel(onImageSelected: (index) {
                      // Handle the selected image index here
                    }),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[300],
                    child: VerticalImageSlider(onImageSelected: (index) {
                      // Handle the selected image index here
                    }),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0), // Adjust padding as needed
            alignment:
                Alignment.bottomCenter, // Align button to the bottom center
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookingCalendarWidget()));
              },
              child: Text(
                'Book a Service',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  
                  ), // Adjust text style as needed
              ),
              style: ElevatedButton.styleFrom(
                 backgroundColor: Theme.of(context).primaryColor,// Adjust text color
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 16), // Adjust padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Adjust border radius
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
