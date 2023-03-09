import 'package:ants/widgets/web/article_card.dart';
import 'package:ants/widgets/button.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';

class QuestSection extends StatelessWidget {
  const QuestSection({Key? key}) : super(key: key);

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
          Image.asset(
            "images/quest-logo.png",
            width: 350,
            filterQuality: FilterQuality.medium,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lob.",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 22)
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 16),
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
                    const ArticleCard(
                      thumbnailUrl: "images/quest-1.webp",
                      title: "Quest Hotel & Conference Center Cebu",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                    SizedBox(width: size.width > 1000 ? 50 : 35),
                    const ArticleCard(
                      thumbnailUrl: "images/quest-2.webp",
                      title: "Quest Plus Conference Center Clark",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                    SizedBox(width: size.width > 1000 ? 50 : 35),
                    const ArticleCard(
                      thumbnailUrl: "images/quest-3.webp",
                      title: "Quest Hotel Tagaytay",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ArticleCard(
                      thumbnailUrl: "images/quest-1.webp",
                      title: "Quest Hotel & Conference Center Cebu",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                    SizedBox(height: 25),
                    ArticleCard(
                      thumbnailUrl: "images/quest-2.webp",
                      title: "Quest Plus Conference Center Clark",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                    SizedBox(height: 25),
                    ArticleCard(
                      thumbnailUrl: "images/quest-3.webp",
                      title: "Quest Hotel Tagaytay",
                      description:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                    ),
                  ],
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
    );
  }
}
