import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/button.dart';
import 'package:ants/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SustainabilitySection extends StatefulWidget {
  const SustainabilitySection({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  State<SustainabilitySection> createState() => _SustainabilitySectionState();
}

class _SustainabilitySectionState extends State<SustainabilitySection>
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
      return Stack(
        alignment:
            widget.size.width > 1366 ? Alignment.center : Alignment.centerRight,
        children: [
          Container(
            height: widget.size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/sustain-temp.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: widget.size.height,
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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
            width: double.infinity,
            alignment: Alignment.center,
            child: SizedBox(
              width: widget.size.width > 1366 ? 1300 : 1000,
              child: Row(
                mainAxisAlignment: widget.size.width > 1000
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widget.size.width > 1300
                        ? 625
                        : widget.size.width > 1000
                            ? 550
                            : widget.size.width,
                    child: Column(
                      crossAxisAlignment: widget.size.width > 1000
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        AnimatedSlideFade(
                          controller: controller,
                          slideInitialPos: const Offset(0, -.2),
                          child: Text(
                            "Effortless Sourcing",
                            style: CHTheme.lightTheme.textTheme.titleSmall
                                ?.copyWith(
                              fontFamily: 'Baskerville',
                              fontSize: widget.size.width > 1366 ? 65 : 42,
                              color: Colors.white,
                            ),
                            textAlign: widget.size.width > 1000
                                ? TextAlign.left
                                : TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AnimatedSlideFade(
                          controller: controller,
                          slideInitialPos: const Offset(.1, 0),
                          child: Container(
                            margin: widget.size.width > 1000
                                ? const EdgeInsets.all(10)
                                : const EdgeInsets.only(left: 35, right: 30),
                            child: Text(
                              "Our team is committed to providing excellent service to our clients, from the initial inquiry to the final delivery of products. We understand the challenges of sourcing from overseas and we strive to make the process as smooth and hassle-free as possible. Our clients can rest assured that we will handle every aspect of the sourcing process, from product selection and quality control to shipping and logistics.",
                              style: widget.size.width > 1366
                                  ? CHTheme.lightTheme.textTheme.titleMedium
                                      ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                    )
                                  : CHTheme.lightTheme.textTheme.titleSmall
                                      ?.copyWith(
                                      color: Colors.white,
                                      height: 1.5,
                                    ),
                              textAlign: widget.size.width > 1000
                                  ? TextAlign.left
                                  : TextAlign.left,
                            ),
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
                              fontSize: widget.size.width > 1000 ? 16 : 20,
                              name: 'READ MORE',
                              type: CHButtonType.blue,
                              onPressed: () {
                                //context.go('/sustainability');
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return VisibilityDetector(
      key: const ValueKey('sustainability-home'),
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
      child: _websiteView(),
    );
  }
}
