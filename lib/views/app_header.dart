
import 'package:flutter/material.dart';
import '../uitheme/style.dart';

class AppHeaderClass extends StatelessWidget {
  final title_text;

  const AppHeaderClass({
    super.key,
    this.title_text});

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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: mainthemecolor(),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                  500), // Set the bottom-left border radius here
            ),
          ),
          height: 150,
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo2.png',
                width: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      title_text,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(width: 10,),
                ],
              ),
            ],
          ),
        ),
      ],);
  }
}