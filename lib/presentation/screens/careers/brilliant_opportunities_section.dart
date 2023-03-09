import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BrilliantOpportunitiesAwaitSection extends StatefulWidget {
  const BrilliantOpportunitiesAwaitSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<BrilliantOpportunitiesAwaitSection> createState() =>
      _BrilliantOpportunitiesAwaitSectionState();
}

class _BrilliantOpportunitiesAwaitSectionState
    extends State<BrilliantOpportunitiesAwaitSection>
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
      key: const ValueKey('brilliant-opportunities-await'),
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
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 10),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            AnimatedSlideFade(
              slideInitialPos: const Offset(0, .05),
              controller: controller,
              child: Text(
                'Brilliant Opportunities Await',
                style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    fontFamily: 'Baskerville',
                    fontSize: widget.size.width > 800 ? 50 : 32,
                    color: CHColor.primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: CHGrid.xLarge,
            ),
            AnimatedSlideFade(
              slideInitialPos: const Offset(0, .05),
              controller: controller,
              child: SizedBox(
                width: widget.size.width > 1400 ? 1317 : widget.size.width * .8,
                child: Text(
                    'Explore available careers with a leading Filipino hospitality group that is committed in the growth of its associates.',
                    style: CHTheme.lightTheme.textTheme.bodyLarge
                        ?.copyWith(fontSize: 22),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
