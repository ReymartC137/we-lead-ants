import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';

import '../appbar.dart';
import '../drawer.dart';
import '../footer_section.dart';
import 'dynamic_article_widget/dynamic_article_banner.dart';
import 'dynamic_article_widget/dynamic_article_content.dart';

class DynamicArticleScreen extends StatelessWidget {
  final String mainTitle;
  final String mainBody;
  final String mainImagePath;
  const DynamicArticleScreen(
      {required this.mainTitle,
      required this.mainBody,
      required this.mainImagePath,
      super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            DynamicArticleBanner(
              imagePath: mainImagePath,
            ),

            DynamicArticleContent(
              contentTitle: "mainTitle",
              contentBody: mainBody,
            ),

            DynamicArticleContent(contentBody: mainBody),
            const SizedBox(
              height: 20,
            ),

            // Container(

            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
