import 'package:flutter/material.dart';

import '../../../widgets/constants/colors.dart';
import '../../../widgets/web/article_card.dart';
import '../../../widgets/web/asset_article_card.dart';
import '../../../widgets/widgets.dart';

class GolfAndActiveLifeStyleSection extends StatelessWidget {
  const GolfAndActiveLifeStyleSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width > 1000 ? 1350 : 400,
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "GOLF & ACTIVE LIFESTYLE",
            textAlign: TextAlign.center,
            style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                fontFamily: 'Baskerville',
                fontSize: size.width > 800
                    ? 48
                    : size.width > 450
                        ? 32
                        : 24,
                color: CHColor.primaryColor),
          ),
          const SizedBox(
            height: 50,
          ),
          size.width > 1000
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        const AssetArticleCard(
                          textAlign: TextAlign.left,
                          logoUrl:
                              "images/MIMOSA PLUS-logo-Vertical-ORIGINAL-01.webp",
                          thumbnailUrl: "images/firehouse_Pizza.webp",
                          title: "Mimosa Golf Club",
                          description:
                              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: CHButton(
                              name: 'VISIT WEBSITE',
                              type: CHButtonType.blue,
                              onPressed: () {}),
                        ),
                      ],
                    ),
                    SizedBox(width: size.width > 1000 ? 50 : 35),
                    Column(
                      children: [
                        const AssetArticleCard(
                          textAlign: TextAlign.left,
                          logoUrl: "images/timberland-logo.webp",
                          thumbnailUrl: "images/brands-thumb-3.webp",
                          title: "Timberland Highlands Resort",
                          description:
                              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: CHButton(
                              name: 'VISIT WEBSITE',
                              type: CHButtonType.blue,
                              onPressed: () {}),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ArticleCard(
                      textAlign: TextAlign.left,
                      logoUrl:
                          "images/MIMOSA PLUS-logo-Vertical-ORIGINAL-01.webp",
                      thumbnailUrl: "images/firehouse_Pizza.webp",
                      title: "Mimosa Golf Club",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: CHButton(
                          name: 'VISIT WEBSITE',
                          type: CHButtonType.blue,
                          onPressed: () {}),
                    ),
                    const SizedBox(height: 25),
                    const AssetArticleCard(
                      textAlign: TextAlign.left,
                      logoUrl: "images/timberland-logo.webp",
                      thumbnailUrl: "images/brands-thumb-3.webp",
                      title: "Timberland Highlands Resort",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: CHButton(
                          name: 'VISIT WEBSITE',
                          type: CHButtonType.blue,
                          onPressed: () {}),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
