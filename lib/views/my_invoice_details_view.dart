import 'package:flutter/material.dart';
import '../uitheme/style.dart';

class MyInvoiceDetailsResponse extends StatelessWidget {
  final List json;

  MyInvoiceDetailsResponse({required this.json});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 600) {
      width = width / 2;
    }

    return Center(
      child: Container(
        width: width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: json.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                bottom: 5.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // Set your desired color
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: GestureDetector(
                  onTap: () {},
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
                                    crossAxisAlignment: WrapCrossAlignment.end,
                                    children: [
                                      Text(
                                        json[index]['item_name'],
                                        style: all_item_name(),
                                        maxLines: 1,
                                        // Show only 2 lines of text
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        " (" +
                                            json[index]['item_packing'] +
                                            " Packing)",
                                        style: all_item_packing(),
                                        maxLines: 1,
                                        // Show only 2 lines of text
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    "By " + json[index]['item_company'],
                                    style: all_item_company(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    bottom: 2,
                                  ),
                                  child: Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.end,
                                    children: [
                                      // Text(
                                      //   "Margin : " +
                                      //       json[index]['item_margin']
                                      //           .toString() +
                                      //       "%",
                                      //   style: all_item_margin(),
                                      //   textAlign: TextAlign.left,
                                      // ),
                                      // Text(" | ", style: all_item_v_line()),
                                      Text(
                                        "Expiry : " +
                                            json[index]['item_expiry'],
                                        style: all_item_expiry(),
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
                        padding: const EdgeInsets.only(left: 5, top: 2),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: [
                            if (json[index]['item_order_quantity'] != "0") ...{
                              Text(
                                "Order quantity : " +
                                    json[index]['item_quantity'],
                                style: all_item_stock(),
                                textAlign: TextAlign.left,
                              ),
                            },
                            if (json[index]['item_scheme'] != "0+0") ...{
                              Text(" | ", style: all_item_v_line()),
                              Text(
                                "Scheme : " + json[index]['item_scheme'],
                                style: all_item_scheme(),
                                textAlign: TextAlign.left,
                              ),
                            },
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2, left: 5),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: [
                            Text(
                              "Price : \u{20B9}" +
                                  json[index]['item_price'] +
                                  "/-" +
                                  " | " +
                                  "Total : \u{20B9}" +
                                  json[index]['item_quantity_price'] +
                                  "/-",
                              style: all_item_price(),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 5,
                          bottom: 5,
                        ),
                        child: Expanded(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            children: [
                              Text(
                                json[index]['item_modalnumber'] +
                                    " | " +
                                    json[index]['item_date_time'],
                                style: all_item_date_time(),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
