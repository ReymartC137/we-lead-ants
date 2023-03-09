import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

enum CHButtonType { blue, outlinedBlue, lightBlue }

Color _getTextColor(CHButtonType type) {
  switch (type) {
    case CHButtonType.blue:
      return Colors.white;
    case CHButtonType.outlinedBlue:
      return CHColor.primaryColor;
    case CHButtonType.lightBlue:
      return CHColor.primaryColor;
  }
}

Color _getBackgroundColor(CHButtonType type) {
  switch (type) {
    case CHButtonType.blue:
      return CHColor.primaryColor;
    case CHButtonType.outlinedBlue:
      return Colors.white;
    case CHButtonType.lightBlue:
      return CHColor.otherBlue;
  }
}

class CHRawButton extends StatelessWidget {
  final String name;
  final Color textColor;
  final Color backgroundColor;
  final double height;
  final double cornerRadius;
  // final Color borderColor;
  final double borderWidth;
  final VoidCallback onPressed;
  final double width;
  final String? fontFamily;
  final double? fontSize;

  const CHRawButton({
    Key? key,
    this.fontSize,
    required this.onPressed,
    required this.name,
    required this.textColor,
    required this.backgroundColor,
    required this.height,
    required this.cornerRadius,
    // required this.borderColor,
    required this.borderWidth,
    required this.width,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: textColor,
          primary: backgroundColor,
          padding: const EdgeInsets.all(8.0),
          // minimumSize: const Size(20, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
            // side: BorderSide(color: borderColor, width: borderWidth),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          name,
          style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: textColor,
            fontFamily: fontFamily ?? 'Avenir',
            fontSize: fontSize ?? 20,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CHButton extends StatelessWidget {
  final String name;
  final CHButtonType type;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final String? fontFamily;
  final double? fontSize;

  const CHButton({
    Key? key,
    this.fontSize,
    this.height = 50,
    this.width = 175,
    required this.name,
    required this.type,
    required this.onPressed,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CHRawButton(
      name: name,
      textColor: _getTextColor(type),
      backgroundColor: _getBackgroundColor(type),
      height: height!,
      cornerRadius: 8,
      borderWidth: 1,
      onPressed: onPressed,
      width: width!,
      fontFamily: fontFamily,
      fontSize: fontSize,
    );
  }
}
