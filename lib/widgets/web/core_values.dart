// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/widgets.dart';

class CoreValuesData {
  final String imagePath;
  final String title;
  final String body;

  CoreValuesData({
    required this.imagePath,
    required this.title,
    required this.body,
  });

  static List<CoreValuesData> data = [
    CoreValuesData(
        imagePath: 'images/4GLt9tPbFBYl94wc 1.webp',
        title: 'Empowerment',
        body:
            'Empowering colleagues inorder to achieve customer satisfaction and goals.'),
    CoreValuesData(
        imagePath: 'images/creativity.webp',
        title: 'Creativity',
        body:
            'Encouraging creativity and unique concepts to innovate our approach to service and management.'),
    CoreValuesData(
        imagePath: 'images/IMG_3978 1.webp',
        title: 'Transparency',
        body:
            'The flat corporate structure creates an environment where open conversations are encouraged.'),
    CoreValuesData(
        imagePath: 'images/flexibility.webp',
        title: 'Flexibility',
        body:
            'The team takes pride in having the flexibility to adapt to changes that occur in the industry. '),
    CoreValuesData(
        imagePath: 'images/fearlessness.webp',
        title: 'Fearlessness',
        body: 'Navigating through challenges enables the team to grow.'),
    CoreValuesData(
        imagePath: 'images/warm_service.webp',
        title: 'Warm Service',
        body:
            'Genuine service that encapsulates Filipino values and hospitality.'),
  ];
}

class CoreValues extends StatelessWidget {
  final String images;
  final String text;
  final String body;
  final double imageSize;

  const CoreValues(
      {Key? key,
      required this.images,
      required this.text,
      required this.body,
      required this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 60, right: 15, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: imageSize,
            backgroundImage: AssetImage(images),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(
            height: CHGrid.small,
          ),
          Text(
            text,
            style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                color: CHColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                height: 1.5),
          ),
          const SizedBox(
            height: CHGrid.small,
          ),
          SizedBox(
            width: size.width > 1366 ? 500 : 200,
            child: Text(
              body,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
