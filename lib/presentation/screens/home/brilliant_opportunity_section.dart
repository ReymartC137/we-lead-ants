import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/button.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BrilliantOpportunitySection extends StatefulWidget {
  const BrilliantOpportunitySection({Key? key}) : super(key: key);

  @override
  State<BrilliantOpportunitySection> createState() =>
      _BrilliantOpportunitySectionState();
}

class _BrilliantOpportunitySectionState
    extends State<BrilliantOpportunitySection>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
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
      return Row(
        children: <Widget>[
          AnimatedSlideFade(
            controller: controller,
            slideInitialPos: const Offset(0, .1),
            child: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20, left: 100),
              alignment: Alignment.centerLeft,
              height: size.height * .8, // size.width > 1366 ? 550 : 450,
              width: size.width * 0.5,
              child: Image.asset(
                "assets/icons/ants-07482.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
          Container(
            padding: size.width > 1366
                ? const EdgeInsets.fromLTRB(0, 50, 50, 50)
                : const EdgeInsets.fromLTRB(50, 50, 50, 50),
            width: size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // width: double.infinity,
                  child: AnimatedSlideFade(
                    controller: controller,
                    slideInitialPos: const Offset(0, .1),
                    child: Text(
                      'Trusted Partnerships \nfor Quality Products',
                      style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                        fontFamily: 'Baskerville',
                        fontSize: size.width > 1366 ? 50 : 48,
                        color: CHColor.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                AnimatedSlideFade(
                  controller: controller,
                  slideInitialPos: const Offset(.1, 0),
                  child: SizedBox(
                    child: Text(
                      "ANTS is committed to providing our clients with the highest level of service and quality. We believe that great sourcing is about more than just finding the right products - it's about building lasting relationships with our clients and suppliers. We look forward to working with you and helping you to find the best products for your business.",
                      style: CHTheme.lightTheme.textTheme.titleSmall
                          ?.copyWith(height: 1.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedSlideFade(
                  controller: controller,
                  slideInitialPos: const Offset(0, .1),
                  child: SizedBox(
                    height: 50,
                    width: 180,
                    child: CHButton(
                      name: 'EXPLORE NOW',
                      type: CHButtonType.blue,
                      onPressed: () {
                        // context.go('/careers');
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

    Widget _mobileView() {
      return AnimatedSlideFade(
        controller: controller,
        slideInitialPos: const Offset(0, .1),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 500,
                child: AspectRatio(
                  aspectRatio: 500 / 400,
                  child: Image.asset(
                    "assets/icons/ants-07482.jpg",
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // width: double.infinity,
                      child: Text(
                        'Trusted Partnerships \nfor Quality Products',
                        style: CHTheme.lightTheme.textTheme.titleSmall
                            ?.copyWith(
                                fontFamily: 'Baskerville',
                                fontSize: size.width > 800 ? 48 : 32,
                                color: CHColor.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      child: Text(
                        "ANTS is committed to providing our clients with the highest level of service and quality. We believe that great sourcing is about more than just finding the right products - it's about building lasting relationships with our clients and suppliers. We look forward to working with you and helping you to find the best products for your business.",
                        style: CHTheme.lightTheme.textTheme.titleSmall
                            ?.copyWith(height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 50,
                      width: 180,
                      child: CHButton(
                        name: 'EXPLORE NOW',
                        type: CHButtonType.blue,
                        onPressed: () {
                          //context.go('/careers');
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return VisibilityDetector(
      key: const ValueKey('brilliant-opportunity-home'),
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
      child: Container(
        width: double.infinity,
        color: const Color(0xFFB8D8EB).withOpacity(0.5),
        child: size.width > 1000 ? _websiteView() : _mobileView(),
      ),
    );
  }
}
