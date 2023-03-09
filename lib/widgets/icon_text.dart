// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ants/core/theme/xtendly_colors.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String iconPath;
  final String text;
  final double? width;
  final Color? color;
  final int? maxLines;
  const IconText({
    Key? key,
    required this.iconPath,
    required this.text,
    this.width,
    this.color,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20, child: Image.asset('assets/icons/$iconPath')),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: width ?? 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  maxLines: maxLines ?? 2,
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      color: color ?? WeLeadColors.foreground,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
