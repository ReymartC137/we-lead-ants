import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../theme.dart';

class DynamicArticleContent extends StatelessWidget {
  final String? contentTitle;
  final String contentBody;
  final String? contentImagepath;
  final bool? imagePositionLeft;
  const DynamicArticleContent(
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
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: contentImagepath == null
                ? SizedBox(
                    width: 1000,
                    child: Text(
                      contentBody,
                      style: CHTheme.lightTheme.textTheme.bodyMedium
                          ?.copyWith(fontSize: 18),
                      textAlign: TextAlign.left,
                      maxLines: 15,
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    width: 1000,
                    child: DropCapText(
                      contentBody,
                      dropCapPosition: DropCapPosition.start,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 18),
                      dropCap: DropCap(
                        width: size.width > 1000 ? 500 : size.width / 2,
                        height: size.width > 1000 ? 300 : size.width / 3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset(
                            contentImagepath!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
