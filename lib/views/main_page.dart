import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 228, 227),
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color.fromARGB(255, 39, 174, 96),
      ),
      body: Column(
        children: [
          Text("Ram Ram Sa!!!"),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/my_notification');
            },
            child: Column(
              children: [
                Icon(Icons.notifications_active_rounded, color: Colors.white),
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/my_order');
            },
            child: Column(
              children: [
                Icon(Icons.notifications_active_rounded, color: Colors.white),
                Text(
                  "My order",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/my_invoice');
            },
            child: Column(
              children: [
                Icon(Icons.notifications_active_rounded, color: Colors.white),
                Text(
                  "My Invoice",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
