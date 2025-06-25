import 'package:flutter/material.dart';
import 'package:new25_drd_flutter_app/views/main_page.dart';

import 'controllers/my_notification.dart';
import 'views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D.R. Distributor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      //home: SplashScreenClass());
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/login': (context) => LoginClass(),
        /*
        '/home': (context) => HomePageClass(),
        '/medicine_search': (context) => MedicineSearchClass(),
        '/my_cart': (context) => MyCartClass(),
        '/my_order': (context) => MyOrderClass(),
        '/my_invoice': (context) => MyInvoiceClass(),*/
        '/my_notification': (context) => MyNotificationClass(),
      },
    );
  }
}
