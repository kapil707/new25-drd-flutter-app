import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../uitheme/style.dart';

class MyNotificationDetailsResponse extends StatelessWidget {
  final List json;

  MyNotificationDetailsResponse({required this.json});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: json.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // Set your desired color
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         MyNotificationDetailsClass(
                //           item_id: json[index]['item_id'],
                //         ),
                //   ),
                // );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          left: 5,
                          right: 5,
                        ),
                        child: Image.network(
                          json[index]['item_image'],
                          height: 64, // Specify the height you want
                          width: 64, // Specify the width you want
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/logo5.png', // ✅ your local image
                              height: 64, // Specify the height you want
                              width: 64, // Specify the width you want
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Wrap(
                                children: [
                                  Text(
                                    json[index]['item_title'],
                                    style: all_item_name(),
                                    maxLines: 1, // Show only 2 lines of text
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Wrap(
                                children: [
                                  Text(
                                    json[index]['item_date_time'],
                                    style: all_item_date_time(),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2,
                      left: 5,
                      right: 5,
                      bottom: 5,
                    ),
                    child: Wrap(
                      children: [Html(data: json[index]['item_message'])],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
