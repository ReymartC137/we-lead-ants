import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChooseYourPathSection extends StatefulWidget {
  const ChooseYourPathSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ChooseYourPathSection> createState() => _ChooseYourPathSectionState();
}

class _ChooseYourPathSectionState extends State<ChooseYourPathSection>
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

    var layoutRow = Container(
      width: size.width > 1366 ? 1300 : 1000,
      margin: size.width > 1366
          ? const EdgeInsets.symmetric(vertical: 50, horizontal: 0)
          : const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your Path of Opportunity',
                  style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                      fontFamily: 'Baskerville',
                      fontSize: size.width > 800 ? 48 : 32,
                      color: CHColor.primaryColor),
                ),
                const SizedBox(height: 10),
                Text(
                  'Get tailored job recommendations based on your skills and interests.',
                  style: size.width > 1000
                      ? CHTheme.lightTheme.textTheme.titleMedium
                          ?.copyWith(fontSize: 22)
                      : CHTheme.lightTheme.textTheme.titleSmall
                          ?.copyWith(fontSize: 14),
                )
              ],
            ),
          ),
          const SizedBox(
            width: CHGrid.medium,
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 60,
              width: 240,
              child: CHButton(
                  name: 'GET STARTED',
                  type: CHButtonType.outlinedBlue,
                  onPressed: () {}),
            ),
          )
        ],
      ),
    );

    var layoutColumn = Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Choose your Path of Opportunity',
            textAlign: TextAlign.center,
            style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                fontFamily: 'Baskerville',
                fontSize: size.width > 800 ? 48 : 32,
                color: CHColor.primaryColor),
          ),
          const SizedBox(
            height: CHGrid.small,
          ),
          Text(
            'Get tailored job recommendations based on your skills and interests.',
            textAlign: TextAlign.center,
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleSmall
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(fontSize: 12),
          ),
          const SizedBox(
            height: CHGrid.large,
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: CHButton(
                name: 'GET STARTED',
                type: CHButtonType.outlinedBlue,
                onPressed: () {}),
          )
        ],
      ),
    );

    return VisibilityDetector(
      key: const ValueKey('choose-your-path'),
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
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          color: const Color(0xFFB8D8EB),
          alignment: Alignment.center,
          child: size.width > 1000 ? layoutRow : layoutColumn,
        ),
      ),
    );
  }
}
