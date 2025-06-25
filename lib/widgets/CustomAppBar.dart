import 'package:dynamic_fa_icons/dynamic_fa_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import '../uitheme/style.dart';
import 'inputs_desions.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String delivery_by;
  final int page_cart;
  final VoidCallback onrefresh;

  const CustomAppBar({
    super.key,
    required this.delivery_by,
    required this.page_cart,
    required this.onrefresh,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600;
    return AppBar(
      titleSpacing: 0,
      backgroundColor: mainthemecolor(),
      leading: IconButton(
        icon: Image.asset('assets/images/logo2.png'),
        // Replace with your image path
        onPressed: () {
          // Add your drawer open/close logic here
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivering to",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            "Code : " + widget.delivery_by,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.search, color: Colors.white,),
        //   onPressed: () async {
        //     String refresh = await Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => MedicineSearchClass(),
        //       ),
        //     );
        //     print("my ref");
        //     setState(() {
        //       if(refresh!=""){
        //         widget.onrefresh();
        //       }
        //     });
        //   },
        // ),
        if (isDesktop(context)) ...{
          IconButtonWithText(
            icon_size: () {
              // Custom function to return Size
              return Size(30, 30);
            },
            icon_title: "Home",
            icon_color: Colors.white,
            icon: Icons.home_filled,
            icon_text: "",
            onPressed: () {},
          ),
          Container(width: 15),
          IconButtonWithText(
            icon_size: () {
              // Custom function to return Size
              return Size(30, 30);
            },
            icon_title: "Medicine Search",
            icon_color: Colors.white,
            icon: Icons.search,
            icon_text: "",
            onPressed: () {},
          ),
          Container(width: 15),
        },
        IconButtonWithText(
          icon_size: () {
            // Custom function to return Size
            return Size(30, 30);
          },
          icon_title: "My cart",
          icon_color: Colors.white,
          icon: Icons.shopping_bag_outlined,
          icon_text: widget.page_cart.toString(),
          onPressed: () async {
            Navigator.pushReplacementNamed(context, '/my_cart');
            // String refresh = await Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => MyCartClass(),
            //     maintainState: true,
            //   ),
            // );
            // setState(() {
            //   if(refresh!=""){
            //     widget.onrefresh();
            //   }
            // });
          },
        ),
        Container(width: 15),
        IconButton(
          icon: FaIcon(DynamicFaIcons.getIconFromName('pizza-slice')),
          onPressed: () {},
        ),
        if (isDesktop(context)) ...{
          IconButtonWithText(
            icon_size: () {
              // Custom function to return Size
              return Size(30, 30);
            },
            icon_title: "My orders",
            icon_color: Colors.white,
            icon: Icons.flag,
            icon_text: "",
            onPressed: () {},
          ),
          Container(width: 15),
          IconButtonWithText(
            icon_size: () {
              // Custom function to return Size
              return Size(30, 30);
            },
            icon_title: "My Invoices",
            icon_color: Colors.white,
            icon: Icons.flag,
            icon_text: "",
            onPressed: () {},
          ),
          Container(width: 15),
          IconButtonWithText(
            icon_size: () {
              // Custom function to return Size
              return Size(30, 30);
            },
            icon_title: "My Notifications",
            icon_color: Colors.white,
            icon: Icons.notifications,
            icon_text: "",
            onPressed: () {},
          ),
          Container(width: 15),
        },
      ],
    );
  }
}

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String page_title;
  final String page_title2;
  final int page_loading;
  final int page_delete_btn;
  final int page_cart;
  final VoidCallback onPressedCallback_delete;
  final VoidCallback onPressedCallback_backbtn;

  CustomAppBar2({
    required this.page_title,
    required this.page_title2,
    required this.page_loading,
    required this.page_delete_btn,
    required this.page_cart,
    required this.onPressedCallback_delete,
    required this.onPressedCallback_backbtn,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: mainthemecolor(),
      iconTheme: IconThemeData(
        color: Colors.white, // Change this color to whatever you need
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onPressedCallback_backbtn,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  page_title,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                if (page_title2.toString() !=
                    "") // Conditionally show page_title2
                  Text(
                    page_title2!, // Use an empty string if page_title2 is null
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
              ],
            ),
          ),
          if (page_loading == 1) ...{
            Container(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(color: Colors.white),
            ),
            Container(width: 5),
          },
          if (page_delete_btn == 1) ...{
            Container(width: 5),
            Container(
              alignment: Alignment.centerRight,
              child: IconButtonWithText(
                icon_size: () {
                  // Custom function to return Size
                  return Size(30, 30);
                },
                icon_title: "Delete All",
                icon_color: Colors.white,
                icon: Icons.delete_outline,
                icon_text: "",
                onPressed: onPressedCallback_delete,
              ),
            ),
          },
          Container(width: 5),
          Container(
            alignment: Alignment.centerRight,
            child: IconButtonWithText(
              icon_size: () {
                // Custom function to return Size
                return Size(30, 30);
              },
              icon_title: "My cart",
              icon_color: Colors.white,
              icon: Icons.shopping_bag_outlined,
              icon_text: page_cart.toString(),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/my_cart');
              },
            ),
          ),
          Container(width: 15),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class AllPageTopBar extends StatelessWidget {
  final String page_title3;
  const AllPageTopBar({super.key, required this.page_title3});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 600) {
      width = width / 2;
    }
    return Container(
      decoration: BoxDecoration(
        color: mainthemecolor(),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            500,
          ), // Set the bottom-left border radius here
        ),
      ),
      height: 65,
      child: Center(
        child: Container(
          width: width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/medicine_search');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ), // Adjust the radius as needed
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: top_bar_icon_color()),
                          Text(
                            "Search medicine / company...",
                            style: top_bar_fix_textbox_style(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      alignment: Alignment.center,
                      child: Text(
                        page_title3,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(width: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteConfirmationDialog extends StatelessWidget {
  final title;
  final message;

  DeleteConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // Return false when canceled
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // Return true when confirmed
          },
          child: Text('Delete'),
        ),
      ],
    );
  }
}
