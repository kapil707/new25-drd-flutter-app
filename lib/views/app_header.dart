
import 'package:flutter/material.dart';
import '../uitheme/style.dart';

class AppHeaderClass extends StatelessWidget {
  final title_text;
  final title_text2;

  const AppHeaderClass({
    super.key,
    this.title_text,
    this.title_text2});

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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: mainthemecolor(),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                  500), // Set the bottom-left border radius here
            ),
          ),
          height: 160,
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo2.png',
                width: 80,
              ),
              SizedBox(height: 10,),
              Center(
          child: Text(
            title_text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),
          ),
        ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      title_text2,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(width: 10,height: 10,),
                ],
              ),
            ],
          ),
        ),
      ],);
  }
}