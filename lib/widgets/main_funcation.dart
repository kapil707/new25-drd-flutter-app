import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  Future<Map<String, String>> GetUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var user_type = prefs.getString('user_type') ?? '';
    var user_altercode = prefs.getString('user_altercode') ?? '';
    var user_password = prefs.getString('user_password') ?? '';
    var chemist_id = prefs.getString('chemist_id') ?? '';
    var user_nrx = prefs.getString('user_nrx') ?? '';

    var user_fname = prefs.getString('user_fname') ?? '';
    var user_image = prefs.getString('user_image') ?? '';

    Map<String, String> strings = {};

    strings['user_type'] = user_type;
    strings['user_altercode'] = user_altercode;
    strings['user_password'] = user_password;
    strings['chemist_id'] = chemist_id;
    strings['user_nrx'] = user_nrx;
    strings['user_fname'] = user_fname;
    strings['user_image'] = user_image;

    return strings;
  }
}

class main_page_no_records extends StatelessWidget {
  const main_page_no_records({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 10,
          child: Center(
            child: Container(
              child: Image.asset(
                'assets/images/cart_empty.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}

class main_page_loading extends StatelessWidget {
  final int loading_status;

  const main_page_loading({super.key, required this.loading_status});

  @override
  Widget build(BuildContext context) {
    if (loading_status == 1) {
      return Center(
        child: Container(
          height: 210,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10.0,
            ), // Set the bottom-left border radius here
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/logo5.png', width: 100),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Please wait....", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      );
    }
    return Text("");
  }
}
