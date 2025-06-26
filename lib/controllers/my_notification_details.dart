import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../retrofit_api.dart';
import '../uitheme/style.dart';
import '../views/my_notification_details_response.dart';
import '../widgets/CustomAppBar.dart';
import '../widgets/main_funcation.dart';

class MyNotificationDetailsClass extends StatefulWidget {
  final item_id;

  const MyNotificationDetailsClass({super.key, this.item_id});
  @override
  State<MyNotificationDetailsClass> createState() =>
      _MyNotificationDetailsClassState();
}

class _MyNotificationDetailsClassState
    extends State<MyNotificationDetailsClass> {
  var page_title = "My notification details";
  var page_title2 = "";
  var page_title3 = "Loading...";

  late int page_loading = 0;
  late int page_delete_btn = 0;
  late int page_cart = 0;

  int loading_status = 1;
  int result_total = 0;
  int get_record = 0;

  List<dynamic> items = []; // List to hold all items

  final apiService = MyApiService(Dio());

  var user_type = "";
  var user_altercode = "";
  var user_password = "";
  var chemist_id = "";
  var user_nrx = "";

  @override
  void initState() {
    super.initState();

    my_notification_details_api(widget.item_id); // Fetch initial data
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final my_cart_ = prefs.getInt('my_cart');
    if (my_cart_ != "") {
      setState(() {
        page_cart = int.parse(my_cart_.toString());
      });
    }
  }

  var page_status_message = "";

  Future<void> my_notification_details_api(var item_id) async {
    UserSession userSession = UserSession();
    Map<String, String> userSessionData = await userSession.GetUserSession();

    user_type = userSessionData['user_type']!;
    user_altercode = userSessionData['user_altercode']!;
    user_password = userSessionData['user_password']!;
    chemist_id = userSessionData['chemist_id']!;
    user_nrx = userSessionData['user_nrx']!;

    setState(() {
      loading_status = 1;
    });
    try {
      final response = await apiService.my_notification_details_api(
        "xx",
        user_type,
        user_altercode,
        user_password,
        chemist_id,
        user_nrx,
        item_id.toString(),
      );
      Map<String, dynamic> jsonData = jsonDecode(response);
      List<dynamic> newItems = jsonData['items'];
      if (newItems.isNotEmpty) {
        items.addAll(newItems); // Append new items to the existing list
        result_total = result_total + newItems.length;
      }
      setState(() {
        if (newItems.toString() != "") {
          loading_status = 0;
        }
        page_title3 = "Found result (" + result_total.toString() + ")";
      });
    } catch (e) {
      throw e;
    }
  }

  VoidCallback onPressedCallback_delete = () {
    print('Button pressed!'); // Your logic here
  };

  @override
  Widget build(BuildContext context) {
    VoidCallback onPressedCallbackBackbtn = () {
      //Navigator.pushReplacementNamed(context, '/home');
      Navigator.pop(context);
    };
    return Scaffold(
      backgroundColor: mainthemebgcolor(),
      appBar: CustomAppBar2(
        page_title: page_title,
        page_title2: page_title2,
        page_loading: page_loading,
        page_delete_btn: page_delete_btn,
        page_cart: page_cart,
        onPressedCallback_delete: onPressedCallback_delete,
        onPressedCallback_backbtn: onPressedCallbackBackbtn,
      ),
      body: Stack(
        children: [
          AllPageTopBar(page_title3: page_title3),
          if (items != "") ...{
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 160,
                    child: MyNotificationDetailsResponse(json: items),
                  ),
                ],
              ),
            ),
          },
          main_page_loading(loading_status: loading_status),
        ],
      ),
    );
  }
}
