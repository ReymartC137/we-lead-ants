import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BringingManegementSection extends StatefulWidget {
  const BringingManegementSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<BringingManegementSection> createState() =>
      _BringingManegementSectionState();
}

class _BringingManegementSectionState extends State<BringingManegementSection>
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
    Widget _websiteView() {
      return Container(
        width: widget.size.width > 1366 ? 1300 : 1000,
        margin: widget.size.width > 1366
            ? const EdgeInsets.symmetric(vertical: 50, horizontal: 0)
            : const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widget.size.width > 1366 ? 550 : 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSlideFade(
                    controller: controller,
                    slideInitialPos: const Offset(0, .05),
                    child: Text(
                      'Relationship Driven Sourcing',
                      style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                        fontFamily: 'Baskerville',
                        fontSize: widget.size.width > 1366 ? 50 : 48,
                        color: CHColor.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AnimatedSlideFade(
                    controller: controller,
                    slideInitialPos: const Offset(-.05, 0.05),
                    child: Text(
                      "At our core, we believe that great sourcing starts with great relationships. That's why we have built strong partnerships with a network of trusted suppliers worldwide. This ensures that we have access to the latest and most innovative products on the market. We work closely with our suppliers to guarantee that our clients receive the highest quality goods at the most competitive prices.",
                      style: widget.size.width > 1366
                          ? CHTheme.lightTheme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                            )
                          : CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                              height: 1.5,
                            ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AnimatedSlideFade(
                    controller: controller,
                    slideInitialPos: const Offset(0, .2),
                    child: SizedBox(
                      height: 50,
                      width: 180,
                      child: CHButton(
                        name: 'READ MORE',
                        type: CHButtonType.blue,
                        onPressed: () {
                          // context.go('/management-services');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            AnimatedSlideFade(
              controller: controller,
              slideInitialPos: const Offset(.1, 0),
              child: Container(
                height: widget.size.width > 1366 ? 450 : 300,
                width: widget.size.width > 1366 ? 625 : 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/team.jpg",
                      ),
                      fit: BoxFit.fitHeight),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _mobileView() {
      return AnimatedSlideFade(
        slideInitialPos: const Offset(0, .05),
        controller: controller,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 500,
                child: AspectRatio(
                  aspectRatio: 500 / 400,
                  child: Image.asset(
                    "assets/images/team.jpg",
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widget.size.width > 1366 ? 600 : 500,
                    child: Text(
                      'Relationship Driven Sourcing',
                      style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                          fontFamily: 'Baskerville',
                          fontSize: widget.size.width > 1366
                              ? 60
                              : widget.size.width > 800
                                  ? 48
                                  : 32,
                          color: CHColor.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 500,
                    child: Text(
                      "At our core, we believe that great sourcing starts with great relationships. That's why we have built strong partnerships with a network of trusted suppliers worldwide. This ensures that we have access to the latest and most innovative products on the market. We work closely with our suppliers to guarantee that our clients receive the highest quality goods at the most competitive prices.",
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
                      name: 'READ MORE',
                      type: CHButtonType.blue,
                      onPressed: () {
                        // context.go('/management-services');
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    return VisibilityDetector(
      key: const ValueKey('bringing-management-section-home'),
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
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: widget.size.width > 1000 ? _websiteView() : _mobileView(),
      ),
    );
  }
}
