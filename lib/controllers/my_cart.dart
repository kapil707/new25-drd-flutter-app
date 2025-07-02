import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../retrofit_api.dart';
import '../uitheme/style.dart';
import '../views/my_cart_view.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/inputs_desions.dart';
import 'my_cart_functions.dart';

class MyCartClass extends StatefulWidget {
  @override
  State<MyCartClass> createState() => _MyCartClassState();
}

class _MyCartClassState extends State<MyCartClass> {
  var page_title = "My cart";
  var page_title2 = "";
  var page_title3 = "Loading...";

  late int page_loading = 0;
  late int page_delete_btn = 0;
  late int page_cart = 0;

  final apiService = MyApiService(Dio());

  List<dynamic> my_cart_items = [];
  @override
  void initState() {
    super.initState();

    loadCartItems();
    my_cart_api();
  }

  var page_status_message = "";
  void my_cart_api() async {
    try {
      setState(() {
        page_title3 = "Loading....";
        page_loading = 1;
      });
      MyCartFunctions my_cart_functions = MyCartFunctions();
      int status = await my_cart_functions.my_cart_api();
      if (status == 1) {
        setState(() {
          loadCartItems();
          page_loading = 0;
        });
      }
    } catch (e) {
      print("error " + e.toString());
    }
  }

  var footer_my_cart = "";
  var footer_my_cart_total = "";

  Future<void> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();

    int? my_cart = prefs.getInt('my_cart');
    double? my_cart_total = prefs.getDouble('my_cart_total');
    var my_cart_items0 = prefs.getString('my_cart_items');
    final my_cart_status_message = prefs.getString('my_cart_status_message')!;

    setState(() {
      page_cart = my_cart!;
      footer_my_cart_total = my_cart_total.toString();
      my_cart_items = jsonDecode(my_cart_items0.toString()) as List<dynamic>;
      page_status_message = my_cart_status_message.toString();

      page_delete_btn = 0;
      if (my_cart == 0) {
        page_title3 = "Your cart is empty";
        footer_my_cart = "Your cart is empty";
      } else {
        page_delete_btn = 1;
        page_title3 = "My cart(" + my_cart.toString() + ")";
        footer_my_cart = "My cart(" + my_cart.toString() + ")";
      }
    });
  }

  Future<void> page_medicine_delete_all_api() async {
    setState(() {
      page_cart = 0;
      page_delete_btn = 0;
      my_cart_items.clear();
      page_title3 = "Your cart is empty";
      footer_my_cart = "Your cart is empty";
    });
    MyCartFunctions my_cart_functions = MyCartFunctions();
    my_cart_functions.medicine_delete_all_api();
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback onpressedcallbackDelete = () async {
      bool deleteConfirmed = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return DeleteConfirmationDialog(
            title: 'Confirm Delete',
            message: 'Are you sure you want to delete all item?',
          );
        },
      );

      if (deleteConfirmed == true) {
        page_medicine_delete_all_api();
      }
    };

    VoidCallback onPressedCallbackBackbtn = () {
      Navigator.pushReplacementNamed(context, '/medicine_search');
    };

    return Scaffold(
      backgroundColor: mainthemebgcolor(),
      appBar: CustomAppBar2(
        page_title: page_title,
        page_title2: page_title2,
        page_loading: page_loading,
        page_delete_btn: page_delete_btn,
        page_cart: page_cart,
        onPressedCallback_delete: onpressedcallbackDelete,
        onPressedCallback_backbtn: onPressedCallbackBackbtn,
      ),
      body: Stack(
        children: [
          AllPageTopBar(page_title3: page_title3),
          if (my_cart_items.isEmpty) ...{
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cart_empty.png',
                    height: 300.0, // Set the height of the image
                  ),
                  Container(
                    height: 45,
                    child: Mybutton(
                      btnName: "+ Add new medicine",
                      btnStyle: main_btn_text_style(),
                      callBack: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MedicineSearchClass(),
                        //   ),
                        // );
                      },
                    ),
                  ),
                ],
              ),
            ),
          },
          if (my_cart_items.isNotEmpty) ...{
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 250,
                    child: my_cart_response(
                      json: my_cart_items,
                      backpage_url: "my_cart",
                    ),
                  ),
                ],
              ),
            ),
            my_cart_footer(
              footer_my_cart: footer_my_cart,
              footer_my_cart_total: footer_my_cart_total,
              page_status_message: page_status_message,
            ),
          },
        ],
      ),
    );
  }
}

class my_cart_footer extends StatelessWidget {
  final footer_my_cart;
  final footer_my_cart_total;
  final page_status_message;
  const my_cart_footer({
    super.key,
    this.footer_my_cart,
    this.footer_my_cart_total,
    this.page_status_message,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 600) {
      width = width / 2;
    }
    return Positioned(
      bottom: 5,
      left: 5,
      right: 5,
      child: Center(
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Html(data: page_status_message),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Column(
                        children: [
                          Text(footer_my_cart, style: footer_my_cart_style()),
                          Text(
                            "\u{20B9}" + footer_my_cart_total + "/-",
                            style: footer_my_cart_total_style(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        height: 45,
                        child: Mybutton(
                          btnName: "Place order",
                          btnStyle: main_btn_text_style(),
                          callBack: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
