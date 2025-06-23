// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../uitheme/style.dart';

class Mybutton extends StatelessWidget {
  final String btnName;
  final Icon? btnIcon;
  final TextStyle? btnStyle;
  final VoidCallback? callBack;

  Mybutton({
    required this.btnName,
    this.btnIcon,
    this.btnStyle,
    this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callBack!();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: main_btn_bg_style(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
      ),
      child: btnIcon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                btnIcon!,
                Container(width: 11),
                Text(btnName, style: btnStyle)
              ],
            )
          : Text(btnName, style: btnStyle),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController mytextController;
  final String? mylabelText;
  final String? myhintText;
  final Icon? myprefixIcon;

  MyTextField({
    required this.mytextController,
    this.mylabelText,
    this.myhintText,
    this.myprefixIcon,
  });

  @override
  Widget build(Object context) {
    return TextField(
      style: TextStyle(fontSize: 15.0),
      controller: mytextController,
      decoration: InputDecoration(
        labelText: mylabelText,
        hintText: myhintText,
        hintStyle: TextStyle(fontSize: 15.0),
        prefixIcon: myprefixIcon!,
        border: InputBorder.none,
      ),
    );
  }
}

class MyPasswordTextField extends StatefulWidget {
  final TextEditingController mytextController;

  MyPasswordTextField({required this.mytextController});

  @override
  State<MyPasswordTextField> createState() => _MyPasswordTextFieldState();
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 15.0),
      controller: widget.mytextController,
      obscureText: _isObscure,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key_sharp),
        hintText: "Enter password",
        hintStyle: TextStyle(fontSize: 15.0),
        fillColor: Colors.white,
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
    );
  }
}

class MyTextSearchField extends StatelessWidget {
  final Function(String) myonChanged;
  final VoidCallback myclearSearchBox;
  final TextEditingController mytextController;
  final String? mylabelText;
  final String? myhintText;
  final Icon? myprefixIcon;

  MyTextSearchField({
    required this.myonChanged,
    required this.mytextController,
    this.mylabelText,
    this.myhintText,
    this.myprefixIcon,
    required this.myclearSearchBox,
  });

  @override
  Widget build(Object context) {
    return TextField(
      style: TextStyle(fontSize: 14.0),
      onChanged: myonChanged,
      controller: mytextController,
      decoration: InputDecoration(
        labelText: mylabelText,
        hintText: myhintText,
        hintStyle: GoogleFonts.roboto(),
        prefixIcon: myprefixIcon!,
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: Icon(Icons.clear, size: 25,),
          onPressed: myclearSearchBox,
        ),
      ),
    );
  }
}


class IconButtonWithText extends StatelessWidget {
  final IconData icon;
  final String icon_text;
  final VoidCallback onPressed;
  final Color icon_color;
  final Function() icon_size;
  final String icon_title;

  IconButtonWithText({
    required this.icon,
    required this.icon_text,
    required this.onPressed,
    required this.icon_color,
    required this.icon_size,
    required this.icon_title,
  });

  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context) =>
        MediaQuery
            .of(context)
            .size
            .width >= 600;
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: icon_color,
            size: icon_size().height,),
          if(icon_text!="")...{
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Container(
                height: 18,
                decoration: BoxDecoration(
                  color: icon_color,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(" " + icon_text + " ", style: TextStyle(
                  color: top_bar_cart_color(),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                ),
              ),
            ),
          },
          if(isDesktop(context))...{
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(icon_title, style: top_bar_icon_title(),),
            ),
          },
        ],
      ),
    );
  }
}

class AddToCartInputBox extends StatelessWidget {
  final TextEditingController mytextController;
  final String? mylabelText;
  final String? myhintText;
  final focusNode;
  AddToCartInputBox({
    required this.mytextController,
    this.mylabelText,
    this.myhintText,
    this.focusNode,
  });

  @override
  Widget build(Object context) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      focusNode: focusNode,
      controller: mytextController,
      decoration: InputDecoration(
        labelText: mylabelText,
        hintText: myhintText,
        border: InputBorder.none,
      ),
    );
  }
}
