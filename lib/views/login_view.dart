import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../retrofit_api.dart';
import '../session.dart';
import '../uitheme/style.dart';
import '../widgets/inputs_desions.dart';
import 'app_footer.dart';
import 'app_header.dart';
import 'main_page.dart';

class LoginClass extends StatefulWidget {
  const LoginClass({super.key});

  @override
  State<LoginClass> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {
  final apiService = MyApiService(Dio());

  var username = TextEditingController();
  var password = TextEditingController();
  var login_status_message = "";
  bool isLoading = false;

  void _functionLogin(_context, String _username, String _password) async {
    var status_message = "";
    if (_username == "") {
      //AppAlertBox.showAlertDialog(_context, "Error", "Enter username");
      status_message = "Enter username";
      setState(() {
        isLoading = false;
        login_status_message = status_message;
      });
    }
    if (_password == "") {
      //AppAlertBox.showAlertDialog(_context, "Error", "Enter password");
      status_message = "Enter password";
      setState(() {
        isLoading = false;
        login_status_message = status_message;
      });
    }
    if (_username != "" && _password != "") {
      setState(() {
        isLoading = true;
      });
      try {
        final response = await apiService.get_login_api(
          "xx",
          _username,
          _password,
          "",
        );
        final status = response.items.first.status;
        status_message = response.items.first.status_message;
        if (status.toString() == "0") {
          //AppAlertBox.showAlertDialog(_context, "Error", status_message);
          setState(() {
            isLoading = false;
            login_status_message = status_message;
          });
        }
        if (status.toString() == "1") {
          setState(() {
            isLoading = false;
            login_status_message = status_message;
          });

          var user_session = response.items.first.user_session;
          var user_fname = response.items.first.user_fname;
          var user_code = response.items.first.user_code;
          var user_altercode = response.items.first.user_altercode;
          var user_type = response.items.first.user_type;
          var user_password = response.items.first.user_password;
          var user_image = response.items.first.user_image;
          var user_nrx = response.items.first.user_nrx;
          var user_cart = 0;

          print('ok ha yha tak to');

          Shared.saveLoginSharedPreference(
            true,
            user_type,
            user_code,
            user_altercode,
            user_password,
            user_image,
            user_fname,
            user_nrx,
            user_cart,
          ).then((value) {});
          /**************************/
          Navigator.pushReplacement(
            _context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        }
      } catch (e) {
        // Handle login error
        print('Login error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 228, 227),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color.fromARGB(255, 39, 174, 96),
      ),
      body: SafeArea(
        child: Column(
          children: [
            AppHeaderClass(
              title_text: "D. R. Distributors Pvt. Ltd.",
              title_text2: "Login",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(height: 30),
                              Text("Enter username", style: login_page_title()),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ), // ✅ Rounded edges
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: MyTextField(
                                  mytextController: username,
                                  myhintText: "Enter username",
                                  myprefixIcon: Icon(
                                    Icons.account_box,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Container(height: 11),
                              Text("Enter password", style: login_page_title()),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ), // ✅ Rounded edges
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: MyPasswordTextField(
                                  mytextController: password,
                                ),
                              ),
                              Container(height: 11),
                              Center(child: Text(login_status_message)),
                              Container(height: 11),
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (isLoading) CircularProgressIndicator(),
                                  ],
                                ),
                              ),
                              if (isLoading == false)
                                Mybutton(
                                  btnName: "Login",
                                  btnIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  btnStyle: mTextStyle11(),
                                  callBack: () {
                                    String _username = username.text.toString();
                                    String _password = password.text.toString();
                                    _functionLogin(
                                      context,
                                      _username,
                                      _password,
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                        Container(height: 40),
                        AppFooterClass(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
