import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../constants/constants.dart';
import '../widgets.dart';

class StaticArticleContent extends StatelessWidget {
  final String? contentTitle;
  final String contentBody;
  final String? contentImagepath;
  final bool? imagePositionLeft;
  const StaticArticleContent(
      {this.contentTitle,
      required this.contentBody,
      this.contentImagepath,
      this.imagePositionLeft = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: size.width > 1000 ? 400 : 300,
            child: contentTitle != null
                ? Text(
                    contentTitle ?? '',
                    style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                        fontFamily: 'Baskerville',
                        fontSize: size.width > 800 ? 48 : 32,
                        color: CHColor.primaryColor),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox(),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1000,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: contentImagepath == null
                ? SizedBox(
                    width: 1000,
                    child: Markdown(
                      data: contentBody,
                    ),
                  )
                : Container(
                    height: 1000,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    width: 1000,
                    child: Markdown(
                      data: contentBody,
                    )),
          ),
        ],
      ),
    );
  }
}
