import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            ...Global.items
                .map(
                  (e) => Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(
                              e['images'],
                              scale: 4,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e['name']),
                              Text("${e['price']} ₹"),
                            ],
                          ),
                          const Spacer(),
                          CupertinoButton(
                            child: const Icon(
                              CupertinoIcons.add_circled,
                              size: 35,
                            ),
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  Global.allCarts.add(e);
                                  e['quantity']++;
                                  e['totalPrice'] = e['price'] * e['quantity'];

                                  Global.totalPrice += e['totalPrice'];
                                });
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      const Divider(
                        height: 1,
                        indent: 100,
                        endIndent: 60,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
