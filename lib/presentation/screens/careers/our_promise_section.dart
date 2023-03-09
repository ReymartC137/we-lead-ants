import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../widgets/web/asset_article_card.dart';

class OurPromiseSection extends StatefulWidget {
  const OurPromiseSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<OurPromiseSection> createState() => _OurPromiseSectionState();
}

class _OurPromiseSectionState extends State<OurPromiseSection>
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
    var layoutRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AssetArticleCard(
          thumbnailUrl: "images/news-thumb-1.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(width: widget.size.width > 1000 ? 50 : 35),
        const AssetArticleCard(
          thumbnailUrl: "images/news-thumb-2.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(width: widget.size.width > 1000 ? 50 : 35),
        const AssetArticleCard(
          thumbnailUrl: "images/news-thumb-3.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
      ],
    );

    var layoutColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        AssetArticleCard(
          thumbnailUrl: "images/news-thumb-1.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(height: 25),
        AssetArticleCard(
          thumbnailUrl: "images/news-thumb-2.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
        ),
        SizedBox(height: 25),
        AssetArticleCard(
          thumbnailUrl: "images/news-thumb-3.webp",
          title: "Lorem ipsum dolor sit amet onsectetuer adipiscing",
          titleColor: Colors.blue,
          description:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
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
          //controller.reverse();
        }
      },
      child: AnimatedSlideFade(
        slideInitialPos: const Offset(0, .05),
        controller: controller,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 0.0),
          color: Colors.white,
          child: Column(
            children: [
              Text(
                "OUR PROMISE",
                style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    fontFamily: 'Baskerville',
                    fontSize: widget.size.width > 800 ? 48 : 32,
                    color: CHColor.primaryColor),
              ),
              const SizedBox(
                height: CHGrid.large,
              ),
              SizedBox(
                width: widget.size.width > 1360 ? 1300 : 1050,
                child: Text(
                  'Our promise is to consistently deliver genuinely unique Filipino Hospitality across all our brands, through heartfelt service that is both inclusive and innovative by tapping into the brilliance of our people in making a positive impact to stakeholders',
                  textAlign: TextAlign.center,
                  style: widget.size.width > 1000
                      ? CHTheme.lightTheme.textTheme.titleMedium?.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)
                      : CHTheme.lightTheme.textTheme.titleSmall
                          ?.copyWith(fontSize: 12),
                ),
              ),
              // const SizedBox(
              //   height: 50,
              // ),
              // size.width > 1000 ? layoutRow : layoutColumn,
            ],
          ),
        ),
      ),
    );
  }
}
