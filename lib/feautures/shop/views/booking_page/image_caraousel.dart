import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final Function(int)
      onImageSelected; // Callback function to notify the selected image index

  ImageCarousel({required this.onImageSelected});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 400,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {},
          ),
          items: [
            'https://picsum.photos/id/1041/300/202',
            'https://picsum.photos/id/1021/300/200',
            'https://picsum.photos/id/1045/300/201',
            'https://picsum.photos/id/1060/300/204',
          ].map((String imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  void setSelectedIndex(int index) {
    _carouselController.jumpToPage(index);
    widget.onImageSelected(index); // Notify the selected image index
  }
}

class VerticalImageSlider extends StatelessWidget {
  final Function(int)
      onImageSelected; // Callback function to notify the selected image index

  VerticalImageSlider({required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            onImageSelected(0);
          },
          child: Image.network(
            'https://picsum.photos/id/1060/300/201',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            onImageSelected(1);
          },
          child: Image.network(
            'https://picsum.photos/id/1045/300/202',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            onImageSelected(2);
          },
          child: Image.network(
            'https://picsum.photos/id/1050/300/204',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            onImageSelected(3);
          },
          child: Image.network(
            'https://picsum.photos/id/1021/300/202',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
