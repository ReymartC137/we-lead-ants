import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/web/image_container.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../widgets/web/asset_article_card.dart';

class OurBrandsSection extends StatefulWidget {
  const OurBrandsSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<OurBrandsSection> createState() => _OurBrandsSectionState();
}

class _OurBrandsSectionState extends State<OurBrandsSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
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

    Widget _websiteView() {
      return Column(
        children: [
          AnimatedSlideFade(
            controller: controller,
            slideInitialPos: const Offset(0, .05),
            child: Text(
              "OUR CUSTOMERS",
              style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                  fontFamily: 'Baskerville',
                  fontSize: size.width > 800 ? 48 : 32,
                  color: CHColor.primaryColor),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          AnimatedSlideFade(
            controller: controller,
            slideInitialPos: const Offset(0, .2),
            child: SizedBox(
              height: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ImageContainer(imagePath: "assets/images/marriot.png"),
                  SizedBox(width: size.width > 1000 ? 50 : 35),
                  const ImageContainer(imagePath: "assets/images/meralco.png"),
                  SizedBox(width: size.width > 1000 ? 50 : 35),
                  const ImageContainer(
                    imagePath: "assets/images/camp bj.jpeg",
                  ),
                  // const AssetArticleCard(
                  //   textAlign: TextAlign.left,
                  //   thumbnailUrl: "images/brands-thumb-1.webp",
                  //   logoUrl: "assets/images/marriot.png",
                  //   description:
                  //       "A sophisticated and bold brand that embodies the warmth of Filipino hospitality. Truly living up to their promise of making guests feel “In a Heartbeat”",
                  // ),
                  // SizedBox(width: size.width > 1000 ? 50 : 35),
                  // const AssetArticleCard(
                  //   textAlign: TextAlign.left,
                  //   thumbnailUrl: "images/brands-thumb-2.webp",
                  //   logoUrl: "assets/images/meralco.png",
                  //   description:
                  //       "Quest’s signature brand of service is well known amongst business travellers, but has also made it’s way to the leisure market",
                  // ),
                  // SizedBox(width: size.width > 1000 ? 50 : 35),
                  // const AssetArticleCard(
                  //   textAlign: TextAlign.left,
                  //   thumbnailUrl: "images/brands-thumb-3.webp",
                  //   logoUrl: "assets/images/camp bj.jpeg",
                  //   description:
                  //       "Revel in nature and adventure at the estate of Timberland Highlands Resort",
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          AnimatedSlideFade(
            controller: controller,
            slideInitialPos: const Offset(0, .1),
            child: CHButton(
              name: 'KNOW MORE',
              type: CHButtonType.blue,
              onPressed: () {
                // context.go('/our-brands');
              },
              height: 50,
              width: 200,
            ),
          )
        ],
      );
    }

    Widget _mobileView() {
      return AnimatedSlideFade(
        slideInitialPos: const Offset(0, .05),
        controller: controller,
        child: Column(
          children: [
            Text(
              "OUR CUSTOMERS",
              style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                  fontFamily: 'Baskerville',
                  fontSize: size.width > 800 ? 48 : 32,
                  color: CHColor.primaryColor),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                // AssetArticleCard(
                //   textAlign: TextAlign.justify,
                //   thumbnailUrl: "images/brands-thumb-1.webp",
                //   logoUrl: "images/crimson-logo.webp",
                //   description:
                //       "A sophisticated and bold brand that embodies the warmth of Filipino hospitality. Truly living up to their promise of making guests feel “In a Heartbeat”",
                // ),
                ImageContainer(imagePath: "assets/images/marriot.png"),
                SizedBox(height: 25),
                ImageContainer(imagePath: "assets/images/meralco.png"),
                // AssetArticleCard(
                //   textAlign: TextAlign.justify,
                //   thumbnailUrl: "images/brands-thumb-2.webp",
                //   logoUrl: "images/quest-logo.webp",
                //   description:
                //       "Quest’s signature brand of service is well known amongst business travellers, but has also made it’s way to the leisure market",
                // ),
                SizedBox(height: 25),
                ImageContainer(
                  imagePath: "assets/images/camp bj.jpeg",
                ),
                // AssetArticleCard(
                //   textAlign: TextAlign.justify,
                //   thumbnailUrl: "images/brands-thumb-3.webp",
                //   logoUrl: "images/timberland-logo.webp",
                //   description:
                //       "Revel in nature and adventure at the estate of Timberland Highlands Resort",
                // ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            AnimatedSlideFade(
              controller: controller,
              slideInitialPos: const Offset(0, .1),
              child: SizedBox(
                height: 50,
                width: 200,
                child: CHButton(
                  name: 'KNOW MORE',
                  type: CHButtonType.blue,
                  onPressed: () {
                    //context.go('/our-brands');
                  },
                ),
              ),
            )
          ],
        ),
      );
    }

    return VisibilityDetector(
      key: const ValueKey('ourbrands-home'),
      onVisibilityChanged: (info) {
        double visibleFraction = info.visibleFraction;
        final widgetToScreenFraction =
            MediaQuery.of(context).size.height / info.size.height;

        if (visibleFraction >=
            (widgetToScreenFraction > 1 ? 1 : widgetToScreenFraction) * .6) {
          controller.forward();
        } else {
          //controller.reverse();
        }
      },
      child: Container(
        width: double.infinity,
        color: const Color(0xFFB8D8EB),
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 0.0),
        child: size.width > 1000 ? _websiteView() : _mobileView(),
      ),
    );
  }
}
