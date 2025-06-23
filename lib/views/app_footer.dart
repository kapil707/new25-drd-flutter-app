
import 'package:flutter/material.dart';

class AppFooterClass extends StatelessWidget {
  const AppFooterClass({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    if (width >= 600) {
      width = width / 2;
    }
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/logo5.png',
            width: 50,
          ),
        ),
        Center(
          child: const Text(
            "D. R. Distributors Pvt. Ltd.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Center(
          child: const Text(
            "App version 48",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class HomePageFooterClass extends StatelessWidget {
  const HomePageFooterClass({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    if (width >= 600) {
      width = width / 2;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              // Set your desired color
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.phone,size: 15,),
                  Text("  +919899133989"),
                ],
              ),
            ),),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              // Set your desired color
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.email,size: 15,),
                  Text("  Vipul@drdindia.com"),
                ],
              ),
            ),),
        ),
      ],
    );
  }
}

