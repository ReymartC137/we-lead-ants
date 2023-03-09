// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final String title;

  final VoidCallback action;
  const CustomTabBar({
    Key? key,
    required this.title,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Tab(
        child: Container(
            width: 500,
            height: 20,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}
