import 'package:flutter/material.dart';
import 'package:stylish/view/splash_screen/splash.dart';

class LaunchPages extends StatelessWidget {
  final String description;
  final bool isBottom;
  final bool isTop;
  final String? mainHead;
  final String? image;
  const LaunchPages({
    super.key,
    required this.size,
    required this.description,
    required this.isBottom,
    required this.isTop,
    this.mainHead,
    this.image,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isTop,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mainHead!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                              fontSize: 30)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(description,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: hintColor,
                              fontSize: 15)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.80,
                height: size.height * 0.50,
                child: Image.asset(
                  image!,
                  fit: BoxFit.contain,
                ),
              ),
              Visibility(
                visible: isBottom,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mainHead!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                              fontSize: 30)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(description,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: hintColor,
                              fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
