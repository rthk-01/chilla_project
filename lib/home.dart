import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'assets/karuthal1.png',
    'assets/karuthal2.png',
    'assets/karuthal3.jpg',
  ];

  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  AnimatedSwitcher(
                    duration: Duration(seconds: 3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.asset(
                        images[_currentIndex],
                        key: ValueKey(_currentIndex),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                      ),
                    ),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                  Positioned(
                    right: 0,
                    height: 10,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 10),
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/chilla_image.png'),
                  ),
                  SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(190, 52),
                      backgroundColor: Color(0xFF57CC99),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      shadowColor: Colors.black,
                      elevation: 9,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
          ],
        ),
      ),
    );
  }
}
