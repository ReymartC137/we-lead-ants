import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/colors.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OurLeaderSection extends StatefulWidget {
  const OurLeaderSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<OurLeaderSection> createState() => _OurLeaderSectionState();
}

class _OurLeaderSectionState extends State<OurLeaderSection>
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
    return VisibilityDetector(
      key: const ValueKey('our-leaders'),
      onVisibilityChanged: (info) {
        double visibleFraction = info.visibleFraction;
        final widgetToScreenFraction =
            MediaQuery.of(context).size.height / info.size.height;

        if (visibleFraction >=
            (widgetToScreenFraction > 1 ? 1 : widgetToScreenFraction) * .3) {
          controller.forward();
        } else {
          //controller.reverse();
        }
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 20, bottom: 200, right: 100, left: 100),
        width: double.infinity,
        color: Colors.white,
        child: AnimatedSlideFade(
          controller: controller,
          slideInitialPos: const Offset(0, .1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OUR LEADERS",
                style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    fontFamily: 'Baskerville',
                    fontSize: widget.size.width > 800 ? 48 : 30,
                    color: CHColor.primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              AnimatedSlideFade(
                controller: controller,
                slideInitialPos: const Offset(0, .1),
                child: SizedBox(
                  width: widget.size.width * .9,
                  child: Image.asset(
                    'images/our_leaders.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              AnimatedSlideFade(
                controller: controller,
                slideInitialPos: const Offset(0, .1),
                child: SizedBox(
                  width: widget.size.width * .8,
                  child: Text(
                    'Our team of executives are experts in their own fields, bringing in decades of valuable experience to service our managed hotels and brands. They breathe life into the brands that Chroma has created, ensuring the sustainability and profitability of the properties that we currently manage, as well as those that are still in the works.',
                    textAlign: TextAlign.center,
                    style: CHTheme.lightTheme.textTheme.titleSmall
                        ?.copyWith(height: 1.5, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
