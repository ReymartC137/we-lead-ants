import 'package:ants/widgets/button.dart';
import 'package:ants/widgets/theme.dart';
import 'package:ants/widgets/web/article_card.dart';
import 'package:flutter/material.dart';

class TimberlandGrafikSection extends StatelessWidget {
  const TimberlandGrafikSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width > 1000 ? 1350 : 400,
      padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 0.0),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.black,
        width: 1,
      ))),
      child: Column(
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lob.",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
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
                        const ArticleCard(
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
                        )
                      ],
                    ),
                    SizedBox(width: size.width > 1000 ? 50 : 35),
                    Column(
                      children: [
                        const ArticleCard(
                          logoUrl: "images/grafik-logo.webp",
                          thumbnailUrl: "images/grafik-thumb-1.webp",
                          isOpening: true,
                          title: "Grafik Hotels & Resorts",
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
                        )
                      ],
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ArticleCard(
                      logoUrl: "images/timberland-logo.webp",
                      thumbnailUrl: "images/brands-thumb-3.webp",
                      title: "Timberland Highlands Resort",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                    SizedBox(height: 25),
                    ArticleCard(
                      logoUrl: "images/grafik-logo.webp",
                      thumbnailUrl: "images/grafik-thumb-1.webp",
                      isOpening: true,
                      title: "Crimson Resort & Spa Boracay",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
