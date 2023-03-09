import 'dart:ui';

import 'package:flutter/material.dart';

class DynamicArticleBanner extends StatelessWidget {
  final String imagePath;
  const DynamicArticleBanner({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: size.height / 1.2, //to add ternary
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 1,
            child: Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imagePath), fit: BoxFit.cover),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
              //child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 260,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * .5,
                  width: size.width > 1000 ? size.width * .4 : size.width * .8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imagePath),
                        fit:
                            size.width > 1000 ? BoxFit.cover : BoxFit.fitWidth),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
