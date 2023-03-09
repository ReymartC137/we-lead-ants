import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/theme.dart';
import 'package:ants/widgets/web/core_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CoreValuesSectionResponsive extends StatefulWidget {
  const CoreValuesSectionResponsive({Key? key}) : super(key: key);

  @override
  State<CoreValuesSectionResponsive> createState() =>
      _CoreValuesSectionResponsiveState();
}

class _CoreValuesSectionResponsiveState
    extends State<CoreValuesSectionResponsive> with TickerProviderStateMixin {
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
      key: const ValueKey('core-values'),
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
      child: LayoutBuilder(
        builder: ((context, constraints) {
          if (constraints.maxWidth >= 995 && constraints.maxWidth <= 1315) {
            return AnimatedSlideFade(
              slideInitialPos: const Offset(0, .05),
              controller: controller,
              child: const CoreValuesSection(
                crossAxisRatio: 3,
                imageSize: 100,
              ),
            );
          } else if (constraints.maxWidth <= 994 &&
              constraints.maxWidth >= 870) {
            return AnimatedSlideFade(
              slideInitialPos: const Offset(0, .05),
              controller: controller,
              child: const CoreValuesSection(
                crossAxisRatio: 2,
                imageSize: 130,
              ),
            );
          } else if (constraints.maxWidth <= 866 &&
              constraints.maxWidth >= 667) {
            return AnimatedSlideFade(
              slideInitialPos: const Offset(0, .05),
              controller: controller,
              child: const CoreValuesSection(
                crossAxisRatio: 2,
                imageSize: 100,
              ),
            );
          } else if (constraints.maxWidth <= 666) {
            return AnimatedSlideFade(
              slideInitialPos: const Offset(0, .05),
              controller: controller,
              child: const CoreValuesSection(
                crossAxisRatio: 1,
                imageSize: 130,
              ),
            );
          } else {
            return AnimatedSlideFade(
              slideInitialPos: const Offset(0, .05),
              controller: controller,
              child: const CoreValuesSection(
                crossAxisRatio: 3,
                imageSize: 160,
              ),
            );
          }
        }),
      ),
    );
  }
}

class CoreValuesSection extends StatelessWidget {
  final int crossAxisRatio;
  final double imageSize;

  const CoreValuesSection({
    Key? key,
    required this.crossAxisRatio,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Text(
            "CORE VALUES",
            style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                fontFamily: 'Baskerville',
                fontSize: size.width > 800 ? 48 : 32,
                color: CHColor.primaryColor),
          ),
          const SizedBox(
            height: CHGrid.large,
          ),
          SizedBox(
            width: 1300,
            child: MasonryGridView.count(
              crossAxisCount: crossAxisRatio,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 520,
                  child: CoreValues(
                      imageSize: imageSize,
                      images: CoreValuesData.data[index].imagePath,
                      text: CoreValuesData.data[index].title,
                      body: CoreValuesData.data[index].body),
                );
              },
              itemCount: CoreValuesData.data.length,
              primary: false,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
