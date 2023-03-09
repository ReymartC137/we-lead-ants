import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/article_widget.dart';
import 'package:flutter/material.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:visibility_detector/visibility_detector.dart';

class NewsContentSection extends StatefulWidget {
  const NewsContentSection({Key? key}) : super(key: key);

  @override
  State<NewsContentSection> createState() => _NewsContentSectionState();
}

class _NewsContentSectionState extends State<NewsContentSection>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var format3x2 = Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ArticleCard(
              thumbnailUrl: "images/news-thumb-1.webp",
              title: "TLorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
            SizedBox(width: size.width > 1000 ? 50 : 35),
            const ArticleCard(
              thumbnailUrl: "images/news-thumb-2.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
            SizedBox(width: size.width > 1000 ? 50 : 35),
            const ArticleCard(
              thumbnailUrl: "images/news-thumb-3.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ArticleCard(
              thumbnailUrl: "images/news-thumb-1.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
            SizedBox(width: size.width > 1000 ? 50 : 35),
            const ArticleCard(
              thumbnailUrl: "images/news-thumb-2.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
            SizedBox(width: size.width > 1000 ? 50 : 35),
            const ArticleCard(
              thumbnailUrl: "images/news-thumb-3.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );

    var format2x3 = Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ArticleCard(
              textAlign: TextAlign.center,
              thumbnailUrl: "images/news-thumb-1.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
            SizedBox(width: size.width > 1000 ? 50 : 35),
            const ArticleCard(
              textAlign: TextAlign.center,
              thumbnailUrl: "images/news-thumb-2.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ArticleCard(
              textAlign: TextAlign.center,
              thumbnailUrl: "images/news-thumb-3.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
            SizedBox(width: size.width > 1000 ? 50 : 35),
            const ArticleCard(
              textAlign: TextAlign.center,
              thumbnailUrl: "images/news-thumb-1.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ArticleCard(
              textAlign: TextAlign.center,
              thumbnailUrl: "images/news-thumb-2.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
            SizedBox(width: size.width > 1000 ? 50 : 35),
            const ArticleCard(
              textAlign: TextAlign.center,
              thumbnailUrl: "images/news-thumb-3.webp",
              title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
              titleColor: Colors.blue,
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );

    var format1x6 = Column(
      children: const [
        ArticleCard(
          textAlign: TextAlign.center,
          thumbnailUrl: "images/news-thumb-1.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(
          height: 50,
        ),
        ArticleCard(
          textAlign: TextAlign.center,
          thumbnailUrl: "images/news-thumb-1.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(
          height: 50,
        ),
        ArticleCard(
          textAlign: TextAlign.center,
          thumbnailUrl: "images/news-thumb-1.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(
          height: 50,
        ),
        ArticleCard(
          textAlign: TextAlign.center,
          thumbnailUrl: "images/news-thumb-1.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(
          height: 50,
        ),
        ArticleCard(
          textAlign: TextAlign.center,
          thumbnailUrl: "images/news-thumb-1.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(
          height: 50,
        ),
        ArticleCard(
          textAlign: TextAlign.center,
          thumbnailUrl: "images/news-thumb-1.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );

    return VisibilityDetector(
        key: const ValueKey('our-promise'),
        onVisibilityChanged: (info) {
          double visibleFraction = info.visibleFraction;
          final widgetToScreenFraction =
              MediaQuery.of(context).size.height / info.size.height;

          if (visibleFraction >=
              (widgetToScreenFraction > 1 ? 1 : widgetToScreenFraction) * .2) {
            controller.forward();
          } else {
            // controller.reverse();
          }
        },
        child: LayoutBuilder(
          builder: ((context, constraints) {
            if (constraints.maxWidth >= 995 && constraints.maxWidth <= 1315) {
              return AnimatedSlideFade(
                slideInitialPos: const Offset(0, .05),
                controller: controller,
                child: const Article(
                  crossAxisRatio: 3,
                  imageSize: 100,
                ),
              );
            } else if (constraints.maxWidth <= 994 &&
                constraints.maxWidth >= 870) {
              return AnimatedSlideFade(
                slideInitialPos: const Offset(0, .05),
                controller: controller,
                child: const Article(
                  crossAxisRatio: 2,
                  imageSize: 130,
                ),
              );
            } else if (constraints.maxWidth <= 866 &&
                constraints.maxWidth >= 667) {
              return AnimatedSlideFade(
                slideInitialPos: const Offset(0, .05),
                controller: controller,
                child: const Article(
                  crossAxisRatio: 2,
                  imageSize: 100,
                ),
              );
            } else if (constraints.maxWidth <= 666) {
              return AnimatedSlideFade(
                slideInitialPos: const Offset(0, .05),
                controller: controller,
                child: const Article(
                  crossAxisRatio: 1,
                  imageSize: 130,
                ),
              );
            } else {
              return AnimatedSlideFade(
                slideInitialPos: const Offset(0, .05),
                controller: controller,
                child: const Article(
                  crossAxisRatio: 3,
                  imageSize: 160,
                ),
              );
            }
          }),
        ));
  }
}
// size.width > 1366
//           ? format3x2
//           : size.width > 800
//               ? format2x3
//               : format1x6