
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/view/landing_page/landing_page.dart';
import 'package:stylish/view/splash_screen/second_splash.dart';

const mainColor = Color.fromRGBO(25, 0, 82, 1);
const hintColor = Color.fromRGBO(25, 0, 82, 0.604);

class ScreenLaunch extends StatelessWidget {
  ScreenLaunch({super.key});
  final _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: TextButton(child: Text('Skip'),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage(),));
            },),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: mainColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LandingPage()));

        },
        child: const Text(
          'Next',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            children: [
              LaunchPages(
                isTop: true,
                isBottom: false,
                size: size,
                mainHead: 'Order Your Food',
                description:
                    'Now you can order food any time right form your mobile',
                image: 'asset/splash3.jpg',
              ),
              LaunchPages(
                isTop: false,
                isBottom: true,
                size: size,
                mainHead: 'Cooking Safe Food',
                description:
                    'We are maintain safety and we keep \nclean while make food',
                image: 'asset/splash2.jpg',
              ),
              LaunchPages(
                isTop: true,
                isBottom: false,
                size: size,
                mainHead: 'Quick Delivery',
                description:
                    'Order your favourite meals will \nbe immediately delivered',
                image: 'asset/splash.jpg',
              ),
            ],
          ),
          Positioned(
              left: 10,
              bottom: 30,
              child: SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 1.1,
                    activeDotColor: mainColor,
                  ),
                  controller: _pageController,
                  count: 3))
        ],
      ),
    );
  }
}
