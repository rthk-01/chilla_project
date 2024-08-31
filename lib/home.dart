import 'package:flutter/material.dart';
import 'package:new_chilla/signup.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 0.45 * MediaQuery.of(context).size.height,
            child: ClipRRect(
              child: Image.asset('assets/image1.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    'assets/chilla_image.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 50),
                Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(252, 60),
                        backgroundColor: Color(0xFF57CC99),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        shadowColor: Colors.black.withOpacity(0.8),
                        elevation: 8,
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
