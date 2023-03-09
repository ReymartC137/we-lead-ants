import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DrivenHospitalitySection extends StatefulWidget {
  const DrivenHospitalitySection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<DrivenHospitalitySection> createState() =>
      _DrivenHospitalitySectionState();
}

class _DrivenHospitalitySectionState extends State<DrivenHospitalitySection>
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
            ? const EdgeInsets.symmetric(vertical: 40, horizontal: 0)
            : const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedSlideFade(
              controller: controller,
              slideInitialPos: const Offset(-.1, .1),
              child: Container(
                height: widget.size.width > 1366 ? 450 : 300,
                width: widget.size.width > 1366 ? 625 : 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/3.jpg'),
                      fit: BoxFit.fitHeight),
                ),
              ),
            ),
            AnimatedSlideFade(
              controller: controller,
              slideInitialPos: const Offset(.1, 0),
              child: SizedBox(
                width: widget.size.width > 1366 ? 550 : 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vision',
                      style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                        fontFamily: 'Baskerville',
                        fontSize: widget.size.width > 1366 ? 50 : 48,
                        color: CHColor.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      child: Text(
                        'We are a company with a team of dedicated professionals with years of experience in sourcing goods from China to the Philippines. Our mission is to provide high-quality sourcing solutions to our clients, helping them to find the best products at competitive prices.',
                        style: widget.size.width > 1366
                            ? CHTheme.lightTheme.textTheme.titleMedium
                                ?.copyWith(
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
                    SizedBox(
                      height: 50,
                      width: 180,
                      child: CHButton(
                        name: 'READ MORE',
                        type: CHButtonType.blue,
                        onPressed: () {
                          // context.go('/who-we-are');
                        },
                      ),
                    )
                  ],
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
                    'assets/images/3.jpg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: widget.size.width > 1366 ? 600 : 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vision',
                      style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                          fontFamily: 'Baskerville',
                          fontSize: widget.size.width > 800 ? 48 : 32,
                          color: CHColor.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: 500,
                      child: Text(
                        'Chroma is a leading management group that focuses on customer experience while incorporating the expertise of team to innovate how things are done in the hotel and food & beverage industry.',
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
                          //  context.go('/who-we-are');
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
      key: const ValueKey('driven-hospitality'),
      onVisibilityChanged: (info) {
        double visibleFraction = info.visibleFraction;
        final widgetToScreenFraction =
            MediaQuery.of(context).size.height / info.size.height;

        if (visibleFraction >=
            (widgetToScreenFraction > 1 ? 1 : widgetToScreenFraction) * .25) {
          controller.forward();
        } else {
          //controller.reverse();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: widget.size.width > 1000 ? _websiteView() : _mobileView(),
      ),
    );
  }
}
