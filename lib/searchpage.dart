import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CupertinoSearchTextField(
                  placeholder: 'Search',
                ),
              ),
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
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e['name']),
                              Text("${e['price']} ₹"),
                            ],
                          ),
                          const Spacer(),
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
