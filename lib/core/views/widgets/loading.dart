import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent, // Set transparent background
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: LinearProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(color ?? Colors.white),
                    backgroundColor: Colors.transparent,
                  ),
                  width: 100,
                  height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
