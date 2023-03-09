import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CHBanner extends StatefulWidget {
  final String imagePath;
  final String title;
  final String body;
  final double screenHeightMultiplier;

  const CHBanner({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.body,
    this.screenHeightMultiplier = .5,
  }) : super(key: key);

  @override
  State<CHBanner> createState() => _CHBannerState();
}

class _CHBannerState extends State<CHBanner> with TickerProviderStateMixin {
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

    return Stack(
      alignment: size.width > 1366 ? Alignment.center : Alignment.centerRight,
      children: [
        Container(
          height: size.height * widget.screenHeightMultiplier,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.imagePath), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: size.height * widget.screenHeightMultiplier,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: size.width > 1000
              ? MainAxisAlignment.end
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: size.width > 1500
                  ? const EdgeInsets.only(right: 56)
                  : const EdgeInsets.only(right: 0),
              child: SizedBox(
                width: size.width > 1366 && widget.title == 'DRIVEN HOSPITALITY'
                    ? size.width * 0.55
                    : size.width > 1366
                        ? size.width * 0.5
                        : size.width > 1000
                            ? size.width * 0.6
                            : size.width > 500
                                ? 500
                                : size.width * 1,
                child: Padding(
                  padding: size.width > 1500
                      ? const EdgeInsets.symmetric(vertical: 0, horizontal: 85)
                      : size.width > 1400
                          ? const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 60)
                          : const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                  child: VisibilityDetector(
                    key: const ValueKey('banner'),
                    onVisibilityChanged: (info) {
                      double visibleFraction = info.visibleFraction;
                      final widgetToScreenFraction =
                          MediaQuery.of(context).size.height / info.size.height;

                      if (visibleFraction >=
                          (widgetToScreenFraction > 1
                                  ? 1
                                  : widgetToScreenFraction) *
                              .1) {
                        controller.forward();
                      } else {
                        //controller.reverse();
                      }
                    },
                    child: Column(
                      crossAxisAlignment: size.width > 1000
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        AnimatedSlideFade(
                          slideInitialPos: const Offset(0, .05),
                          controller: controller,
                          child: Text(
                            widget.title,
                            style: CHTheme.lightTheme.textTheme.titleSmall
                                ?.copyWith(
                                    fontFamily: 'Baskerville',
                                    fontSize: size.width > 1366
                                        ? 50
                                        : size.width > 800
                                            ? 38
                                            : 30,
                                    color: Colors.white),
                            textAlign: size.width > 1000
                                ? TextAlign.left
                                : TextAlign.center,
                          ),
                        ),
                        AnimatedSlideFade(
                          slideInitialPos: const Offset(0, .05),
                          controller: controller,
                          child: SizedBox(
                            child: Text(
                              widget.body,
                              style: CHTheme.lightTheme.textTheme.titleSmall
                                  ?.copyWith(color: Colors.white, height: 1.5),
                              textAlign: size.width > 1000
                                  ? TextAlign.left
                                  : TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
