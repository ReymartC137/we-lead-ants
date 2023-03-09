import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/button.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../widgets/constants/colors.dart';
import '../../../widgets/web/asset_article_card.dart';

class CrimsonSection extends StatefulWidget {
  const CrimsonSection({Key? key}) : super(key: key);

  @override
  State<CrimsonSection> createState() => _CrimsonSectionState();
}

class _CrimsonSectionState extends State<CrimsonSection>
    with TickerProviderStateMixin {
  late final AnimationController titleCtrl;
  late final AnimationController contentCtrl;

  @override
  void initState() {
    super.initState();
    titleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    contentCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          titleCtrl.forward();
        },
      );
    });
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width > 1000 ? 1350 : 400,
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
      decoration: const BoxDecoration(border: Border()),
      child: Column(
        children: [
          AnimatedSlideFade(
            controller: titleCtrl,
            slideInitialPos: const Offset(0, .2),
            child: Text(
              "HOTELS",
              textAlign: TextAlign.center,
              style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                  fontFamily: 'Baskerville',
                  fontSize: size.width > 800 ? 48 : 32,
                  color: CHColor.primaryColor),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          AnimatedSlideFade(
            controller: titleCtrl,
            slideInitialPos: const Offset(0, .2),
            child: Image.asset(
              "images/crimson-logo.webp",
              width: 350,
              filterQuality: FilterQuality.medium,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          AnimatedSlideFade(
            controller: titleCtrl,
            slideInitialPos: const Offset(0, -.2),
            child: SizedBox(
              width: size.width > 1000 ? size.width * .85 : size.width * .82,
              child: Text(
                "Rich in cosmopolitan style, Crimson Hotels & Resorts indulge guests with sleek design spaces and warm Filipino hospitality. ",
                style: size.width > 1000
                    ? CHTheme.lightTheme.textTheme.titleSmall
                        ?.copyWith(fontSize: 22)
                    : CHTheme.lightTheme.textTheme.titleSmall
                        ?.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          size.width > 1000
              ? VisibilityDetector(
                  key: const ValueKey('crimson-content-ourbrands'),
                  onVisibilityChanged: (info) {
                    double visibleFraction = info.visibleFraction;
                    final widgetToScreenFraction =
                        MediaQuery.of(context).size.height / info.size.height;

                    if (visibleFraction >=
                        (widgetToScreenFraction > 1
                                ? 1
                                : widgetToScreenFraction) *
                            .3) {
                      contentCtrl.forward();
                    } else {
                      // contentCtrl.reverse();
                    }
                  },
                  child: AnimatedSlideFade(
                    controller: contentCtrl,
                    slideInitialPos: const Offset(0, .1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const AssetArticleCard(
                          textAlign: TextAlign.left,
                          thumbnailUrl: "images/crimson-1.webp",
                          title: "Crimson Resort & Spa Mactan",
                          description:
                              "A sprawling 6-hectare beach resort and spa located in Mactan, Cebu with luxurious private pool villas...",
                        ),
                        SizedBox(width: size.width > 1000 ? 50 : 35),
                        const AssetArticleCard(
                          textAlign: TextAlign.left,
                          thumbnailUrl: "images/crimson-2.webp",
                          title: "Crimson Resort & Spa Boracay",
                          description:
                              "Situated in an exclusive location, uniquely coined as Station Zero, get breathtaking views, pristine white sand...",
                        ),
                        SizedBox(width: size.width > 1000 ? 50 : 35),
                        const AssetArticleCard(
                          textAlign: TextAlign.left,
                          thumbnailUrl: "images/crimson-3.webp",
                          title: "Crimson Hotel Filinvest City Manila",
                          description:
                              "A five-star hotel located in one of the metro’s modern central business districts and premier lifestyle...",
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    AssetArticleCard(
                      textAlign: TextAlign.left,
                      thumbnailUrl: "images/crimson-1.webp",
                      title: "Crimson Resort & Spa Mactan",
                      description:
                          "A sprawling 6-hectare beach resort and spa located in Mactan, Cebu with luxurious private pool villas...",
                    ),
                    SizedBox(height: 25),
                    AssetArticleCard(
                      textAlign: TextAlign.left,
                      thumbnailUrl: "images/crimson-2.webp",
                      title: "Crimson Resort & Spa Boracay",
                      description:
                          "Situated in an exclusive location, uniquely coined as Station Zero, get breathtaking views, pristine white sand...",
                    ),
                    SizedBox(height: 25),
                    AssetArticleCard(
                      textAlign: TextAlign.left,
                      thumbnailUrl: "images/crimson-3.webp",
                      title: "Crimson Hotel Filinvest City Manila",
                      description:
                          "A five-star hotel located in one of the metro’s modern central business districts and premier lifestyle...",
                    ),
                  ],
                ),
          const SizedBox(
            height: 50,
          ),
          AnimatedSlideFade(
            controller: contentCtrl,
            slideInitialPos: const Offset(0, .1),
            child: SizedBox(
              height: 50,
              width: 200,
              child: CHButton(
                  name: 'VISIT WEBSITE',
                  type: CHButtonType.blue,
                  onPressed: () {}),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          QuestCrimson(size: size),
          const SizedBox(
            height: 60,
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
                          logoUrl: "images/grafik-logo.webp",
                          thumbnailUrl: "images/grafik-thumb-1.webp",
                          isOpening: true,
                          title: "Grafik Hotels & Resorts",
                          description:
                              "Grafik is slated to have its first property to open in the breezy city of Bagiuo by quarter 4 of 2025...",
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
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AssetArticleCard(
                      textAlign: TextAlign.left,
                      logoUrl: "images/grafik-logo.webp",
                      thumbnailUrl: "images/grafik-thumb-1.webp",
                      isOpening: true,
                      title: "Crimson Resort & Spa Boracay",
                      description:
                          "Grafik is slated to have its first property to open in the breezy city of Bagiuo by quarter 4 of 2025...",
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
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class QuestCrimson extends StatefulWidget {
  const QuestCrimson({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<QuestCrimson> createState() => _QuestCrimsonState();
}

class _QuestCrimsonState extends State<QuestCrimson>
    with SingleTickerProviderStateMixin {
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
    return VisibilityDetector(
      key: const ValueKey('crimson-quest-ourbrands'),
      onVisibilityChanged: (info) {
        double visibleFraction = info.visibleFraction;
        final widgetToScreenFraction =
            MediaQuery.of(context).size.height / info.size.height;

        if (visibleFraction >=
            (widgetToScreenFraction > 1 ? 1 : widgetToScreenFraction) * .5) {
          controller.forward();
        } else {
          //controller.reverse();
        }
      },
      child: Column(
        children: [
          AnimatedSlideFade(
            controller: controller,
            slideInitialPos: const Offset(0, .2),
            child: Image.asset(
              "images/quest-logo.webp",
              width: 350,
              filterQuality: FilterQuality.medium,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          AnimatedSlideFade(
            controller: controller,
            slideInitialPos: const Offset(-.1, 0),
            child: Text(
              "Providing guests with straightforward yet comfortable accommodations, Quest Hotels & Resorts exemplifies value for money matched with excellent service. ",
              style: widget.size.width > 1000
                  ? CHTheme.lightTheme.textTheme.titleSmall
                      ?.copyWith(fontSize: 22)
                  : CHTheme.lightTheme.textTheme.titleSmall
                      ?.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          widget.size.width > 1000
              ? AnimatedSlideFade(
                  controller: controller,
                  slideInitialPos: const Offset(0, .2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const AssetArticleCard(
                        textAlign: TextAlign.left,
                        thumbnailUrl: "images/quest-1.webp",
                        title: "Quest Hotel & Conference Center Cebu",
                        description:
                            "A three-star hotel featuring 427 rooms and facilities such as a modern gym exclusive to hotel guests, swimming pool...",
                      ),
                      SizedBox(width: widget.size.width > 1000 ? 50 : 35),
                      const AssetArticleCard(
                        textAlign: TextAlign.left,
                        thumbnailUrl: "images/quest-2.webp",
                        title: "Quest Plus Conference Center Clark",
                        description:
                            "a choice destination for business functions and Staycations. Its meeting rooms are set-up with the latest boardroom..",
                      ),
                      SizedBox(width: widget.size.width > 1000 ? 50 : 35),
                      const AssetArticleCard(
                        textAlign: TextAlign.left,
                        thumbnailUrl: "images/quest-3.webp",
                        title: "Quest Hotel Tagaytay",
                        description:
                            "An ideal place for guests looking for an escape in the South located right in the heart of Tagaytay City...",
                      ),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    AssetArticleCard(
                      textAlign: TextAlign.left,
                      thumbnailUrl: "images/quest-1.webp",
                      title: "Quest Hotel & Conference Center Cebu",
                      description:
                          "A three-star hotel featuring 427 rooms and facilities such as a modern gym exclusive to hotel guests, swimming pool...",
                    ),
                    SizedBox(height: 25),
                    AssetArticleCard(
                      textAlign: TextAlign.left,
                      thumbnailUrl: "images/quest-2.webp",
                      title: "Quest Plus Conference Center Clark",
                      description:
                          "a choice destination for business functions and Staycations. Its meeting rooms are set-up with the latest boardroom..",
                    ),
                    SizedBox(height: 25),
                    AssetArticleCard(
                      textAlign: TextAlign.left,
                      thumbnailUrl: "images/quest-3.webp",
                      title: "Quest Hotel Tagaytay",
                      description:
                          "An ideal place for guests looking for an escape in the South located right in the heart of Tagaytay City...",
                    ),
                  ],
                ),
          const SizedBox(
            height: 50,
          ),
          AnimatedSlideFade(
            controller: controller,
            slideInitialPos: const Offset(0, .2),
            child: SizedBox(
              height: 50,
              width: 200,
              child: CHButton(
                  name: 'VISIT WEBSITE',
                  type: CHButtonType.blue,
                  onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
