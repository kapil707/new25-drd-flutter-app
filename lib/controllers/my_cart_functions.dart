import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../retrofit_api.dart';
import '../widgets/main_funcation.dart';

class MyCartFunctions {
  final apiService = MyApiService(Dio());
  var user_type = "";
  var user_altercode = "";
  var user_password = "";
  var chemist_id = "";
  var user_nrx = "";

  Future<void> add_items_in_cart(
    int my_cart_status,
    int my_cart,
    String my_cart_total,
    List<dynamic> my_cart_items0,
    String my_cart_status_message,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var my_cart_items = jsonEncode(my_cart_items0);

    double my_cart_total1 = double.parse(my_cart_total);

    prefs.setInt('my_cart', my_cart);
    prefs.setDouble('my_cart_total', my_cart_total1);
    prefs.setString('my_cart_items', my_cart_items);
    prefs.setString('my_cart_status_message', my_cart_status_message);
  }

  Future<int> my_cart_api() async {
    UserSession userSession = UserSession();
    Map<String, String> userSessionData = await userSession.GetUserSession();

    user_type = userSessionData['user_type']!;
    user_altercode = userSessionData['user_altercode']!;
    user_password = userSessionData['user_password']!;
    chemist_id = userSessionData['chemist_id']!;
    user_nrx = userSessionData['user_nrx']!;

    try {
      final response = await apiService.my_cart_api(
        "xx",
        user_type,
        user_altercode,
        user_password,
        chemist_id,
        user_nrx,
      );

      Map<String, dynamic> jsonData = jsonDecode(response);
      List<dynamic> my_cart_items = jsonData['items'];
      List<dynamic> items_other0 = jsonData['items_other'];
      Map<String, dynamic> items_other = items_other0.first;
      int items_total = items_other['items_total'];
      var items_price = items_other['items_price'];
      var status_message = items_other['status_message'];
      var status = 1;
      /****************************/
      add_items_in_cart(
        status,
        items_total,
        items_price,
        my_cart_items,
        status_message,
      );
      /****************************/
      return status;
    } catch (e) {
      throw e;
    }
  }

  void medicine_delete_all_api() async {
    var status = 1;
    var items_total = 0;
    var items_price = "0";
    List<dynamic> my_cart_items = [];
    var status_message = "";
    add_items_in_cart(
      status,
      items_total,
      items_price,
      my_cart_items,
      status_message,
    );

    UserSession userSession = UserSession();
    Map<String, String> userSessionData = await userSession.GetUserSession();

    user_type = userSessionData['user_type']!;
    user_altercode = userSessionData['user_altercode']!;
    user_password = userSessionData['user_password']!;
    chemist_id = userSessionData['chemist_id']!;
    user_nrx = userSessionData['user_nrx']!;

    try {
      final response = await apiService.medicine_delete_all_api(
        "xx",
        user_type,
        user_altercode,
        user_password,
        chemist_id,
        user_nrx,
      );

      Map<String, dynamic> jsonData = jsonDecode(response);
      final success = jsonData['success'];
      //print(success);
      if (success == "1") {
        //my_cart_api();
      }
      // return 0;
    } catch (e) {
      // Handle login error
      print('Login error: $e');
    }
  }

  void medicine_add_to_cart_api(
    BuildContext context,
    var item_order_quantity,
    var item_code,
    var item_image,
    var item_name,
    var item_packing,
    var item_expiry,
    var item_company,
    var item_scheme,
    var item_margin,
    var item_featured,
    var item_price,
  ) async {
    /**********************************************/
    add_values_on_cart(
      item_order_quantity,
      item_code,
      item_image,
      item_name,
      item_packing,
      item_expiry,
      item_company,
      item_scheme,
      item_margin,
      item_featured,
      item_price,
    );
    /**********************************************/

    UserSession userSession = UserSession();
    Map<String, String> userSessionData = await userSession.GetUserSession();

    user_type = userSessionData['user_type']!;
    user_altercode = userSessionData['user_altercode']!;
    user_password = userSessionData['user_password']!;
    chemist_id = userSessionData['chemist_id']!;
    user_nrx = userSessionData['user_nrx']!;

    /********************************************************/
    var modalnumber = 'Unknown';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print(androidInfo.device);
      modalnumber = androidInfo.device;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print(iosInfo.name);
      modalnumber = iosInfo.name;
    }
    /********************************************************/

    var mobilenumber = "xx";
    var device_id = "zz";
    try {
      final response = await apiService.medicine_add_to_cart_api(
        "xx",
        user_type,
        user_altercode,
        user_password,
        chemist_id,
        user_nrx,
        item_code,
        item_order_quantity,
        mobilenumber,
        modalnumber.toString(),
        device_id,
      );
      //print(response);
      Map<String, dynamic> jsonData = jsonDecode(response);
      final success = jsonData['success'];
      print(success);
      if (success == 1) {}
    } catch (e) {
      // Handle login error
      print('Login error: $e');
    }
  }

  void add_values_on_cart(
    var item_order_quantity_txt,
    var item_code,
    var item_image,
    var item_name,
    var item_packing,
    var item_expiry,
    var item_company,
    var item_scheme,
    var item_margin,
    var item_featured,
    var item_price,
  ) async {
    /**********************************************/
    var modalnumber = "This device";

    double item_quantity_price =
        double.parse(item_price) * int.parse(item_order_quantity_txt);

    final prefs = await SharedPreferences.getInstance();

    int my_cart = int.parse(prefs.getInt('my_cart').toString());
    var my_cart_total = prefs.getDouble('my_cart_total');
    var my_cart_items = prefs.getString('my_cart_items');

    my_cart = my_cart + 1;
    prefs.setInt('my_cart', my_cart);

    double my_cart_total1 =
        item_quantity_price + double.parse(my_cart_total.toString());
    prefs.setDouble('my_cart_total', my_cart_total1);
    /**********************************************/

    String user_cart_json = my_cart_items.toString();
    List<dynamic> itemList = jsonDecode(user_cart_json);

    /**********************************************/
    // Add a new item to the list
    Map<String, dynamic> newItem = {
      "item_id": item_code,
      "item_code": item_code,
      "item_order_quantity": item_order_quantity_txt,
      "item_image": item_image,
      "item_name": item_name,
      "item_packing": item_packing,
      "item_expiry": item_expiry,
      "item_company": item_company,
      "item_scheme": item_scheme,
      "item_margin": item_margin,
      "item_featured": item_featured,
      "item_price": item_price,
      "item_quantity_price": item_quantity_price.toString(),
      "item_date_time": "Just now",
      "item_modalnumber": modalnumber,
    };

    itemList.insert(0, newItem);
    // Convert the list back to JSON string
    String newJsonString = jsonEncode(itemList);

    prefs.setString('my_cart_items', newJsonString);
  }
}
