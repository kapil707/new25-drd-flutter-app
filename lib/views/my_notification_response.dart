import 'package:flutter/material.dart';

import '../uitheme/style.dart';

class MyNotificationResponse extends StatelessWidget {
  final List json;
  final ScrollController scrollController;

  MyNotificationResponse({required this.json, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: json.length,
      controller: scrollController,
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
                //     builder: (context) => MyNotificationDetailsClass(
                //       item_id: json[index]['item_id'],
                //     ),
                //   ),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          json[index]['item_image'],
                          height: 64, // Specify the height you want
                          width: 64, // Specify the width you want
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      json[index]['item_title'],
                                      style: all_item_name(),
                                      maxLines: 1, // Show only 2 lines of text
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      json[index]['item_message'],
                                      style: all_item_margin(),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      json[index]['item_date_time'],
                                      style: all_item_margin(),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
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
      },
    );
  }
}
