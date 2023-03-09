import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../services/bloc/subscribed_email_bloc/subscribe_email_bloc.dart';

class BeUpdatedSection extends StatefulWidget {
  const BeUpdatedSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<BeUpdatedSection> createState() => _BeUpdatedSectionState();
}

class _BeUpdatedSectionState extends State<BeUpdatedSection>
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
    final TextEditingController emailController = TextEditingController();
    return VisibilityDetector(
      key: const ValueKey('be-updated-section'),
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
      child: AnimatedSlideFade(
        slideInitialPos: const Offset(0, .05),
        controller: controller,
        child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
          alignment: Alignment.center,
          child: SizedBox(
            width: widget.size.width > 1366 ? 1300 : 1000,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  width: double.infinity,
                  height: widget.size.height * 0.35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/shipping-img1.jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: widget.size.height * 0.35,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: const [0.3, 0.75, 1],
                      colors: [
                        const Color(0xFFCAE9EE),
                        const Color(0xFF96C2C3).withOpacity(0.5),
                        const Color(0xFFCAE9EE).withOpacity(0),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: widget.size.width > 1000
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: widget.size.width > 1366
                          ? widget.size.width * 0.5
                          : widget.size.width > 1000
                              ? widget.size.width * 0.6
                              : widget.size.width > 500
                                  ? 500
                                  : widget.size.width * 1,
                      child: Padding(
                        padding: widget.size.width > 1000
                            ? const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 100)
                            : const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 40),
                        child: Column(
                          crossAxisAlignment: widget.size.width > 1000
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Be Updated',
                              style: CHTheme.lightTheme.textTheme.titleSmall
                                  ?.copyWith(
                                fontFamily: 'Baskerville',
                                color: CHColor.primaryColor,
                                fontSize: widget.size.width > 1366
                                    ? 60
                                    : widget.size.width > 800
                                        ? 48
                                        : 32,
                              ),
                            ),
                            const SizedBox(
                              height: CHGrid.xxSmall,
                            ),
                            SizedBox(
                              child: Text(
                                'Subscribe to our news letter to be updated on the latest trading events of We Lead Ants.',
                                style: CHTheme.lightTheme.textTheme.titleSmall
                                    ?.copyWith(
                                  color: Colors.black,
                                  height: 1.5,
                                  fontSize: widget.size.width > 1000 ? 16 : 12,
                                ),
                                textAlign: widget.size.width > 1000
                                    ? TextAlign.left
                                    : TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: CHGrid.medium,
                            ),
                            Row(
                              mainAxisAlignment: widget.size.width > 1000
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: widget.size.width > 1000 ? 58 : 40,
                                  width: widget.size.width > 1000 ? 300 : 180,
                                  child: TextField(
                                    controller: emailController,
                                    textAlign: TextAlign.justify,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(.5),
                                      hintText: 'Your email here...',
                                      hintStyle: CHTheme
                                          .lightTheme.textTheme.titleSmall
                                          ?.copyWith(
                                        color: Colors.black,
                                        height: 1.5,
                                        fontSize:
                                            widget.size.width > 1000 ? 18 : 13,
                                      ),
                                    ),
                                  ),
                                ),
                                BlocBuilder<SubscribeEmailBloc,
                                    SubscribeEmailState>(
                                  builder: (context, state) {
                                    return Flexible(
                                      flex: widget.size.width > 1000 ? 6 : 3,
                                      // height: 50,
                                      // width: 175,
                                      child: CHButton(
                                          height: widget.size.width > 1000
                                              ? 58
                                              : 40,
                                          width: widget.size.width >= 1000
                                              ? 200
                                              : 100,
                                          name: 'SUBSCRIBE',
                                          fontSize: widget.size.width > 1000
                                              ? 16
                                              : 13,
                                          type: CHButtonType.blue,
                                          onPressed: () {
                                            context
                                                .read<SubscribeEmailBloc>()
                                                .add(SubscribeNewEmailEvent(
                                                    email:
                                                        emailController.text));
                                            showDialog(
                                                barrierDismissible: true,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 2000),
                                                      () {
                                                    Navigator.of(context)
                                                        .pop(true);
                                                    emailController.clear();
                                                  });
                                                  return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: SizedBox(
                                                      width: 100,
                                                      height: 100,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Text('Success')
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          }),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
