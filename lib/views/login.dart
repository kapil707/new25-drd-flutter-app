import 'package:flutter/material.dart';
import '../uitheme/style.dart';
import '../widgets/inputs_desions.dart';
import 'app_footer.dart';
import 'app_header.dart';

class LoginClass extends StatefulWidget {
  const LoginClass({super.key});

  @override
  State<LoginClass> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {
  var username = TextEditingController();
  var password = TextEditingController();
  var login_status_message = "";
  bool isLoading = false;
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
                                    /*String _username = username.text.toString();
                          String _password = password.text.toString();
                          _functionLogin(context, _username, _password);*/
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
