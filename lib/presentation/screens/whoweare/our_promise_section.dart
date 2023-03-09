import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/colors.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
          controller.reverse();
        }
      },
      child: AnimatedSlideFade(
        slideInitialPos: const Offset(0, .05),
        controller: controller,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OUR PROMISE",
                style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    fontFamily: 'Baskerville',
                    fontSize: widget.size.width > 800 ? 48 : 30,
                    color: CHColor.primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: widget.size.width > 1366 ? 800 : 500,
                child: Text(
                  'Our promise is to consistently deliver genuinely unique Filipino Hospitality across all our brands, through heartfelt service that is both inclusive and innovative by tapping into the brilliance of our people in making a positive impact to stakeholders.',
                  style: CHTheme.lightTheme.textTheme.titleSmall
                      ?.copyWith(height: 1.5, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
