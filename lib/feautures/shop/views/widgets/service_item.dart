import 'package:flutter/material.dart';

class ServiceItem extends StatefulWidget {
  final List<Service> services;

  ServiceItem({
    required this.services,
  });

  @override
  _ServiceItemState createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8, // Adjust viewportFraction for centering images
    );
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round() % widget.services.length;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.services.length *
                  100, // Large number for infinite scroll effect
              itemBuilder: (context, index) {
                final service = widget.services[index % widget.services.length];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(service.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.services.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 10.0),
                width: _currentPage == index ? 10.0 : 6.0,
                height: _currentPage == index ? 10.0 : 6.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.services[_currentPage].name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                '238 reviews', // Replace with actual review count
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            widget.services[_currentPage].price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'Some description about the service Some description about the service Some description about the service',
          )
        ],
      ),
    );
  }
}

class Service {
  final String name;
  final String price;
  final String imageUrl;

  Service({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
