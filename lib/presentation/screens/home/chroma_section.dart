// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ants/widgets/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChromaSection extends StatefulWidget {
  final VoidCallback onTap;
  final bool isWeb;
  const ChromaSection({
    Key? key,
    required this.onTap,
    required this.isWeb,
  }) : super(key: key);

  @override
  State<ChromaSection> createState() => _ChromaSectionState();
}

class _ChromaSectionState extends State<ChromaSection>
    with TickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  late final AnimationController controller;
  String? videoURL;
  bool isVideoReady = false;
  double appear = 0.0;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _videoPlayerController =
        VideoPlayerController.asset('assets/video/ants.mp4')
          ..setVolume(0)
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((value) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              _videoPlayerController.play();

              setState(() {
                isVideoReady = true;
              });
            });
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return VisibilityDetector(
      key: const ValueKey('home-fade'),
      onVisibilityChanged: (info) {
        setState(() {
          appear = info.visibleFraction;
        });
        double visibleFraction = info.visibleFraction;
        final widgetToScreenFraction =
            MediaQuery.of(context).size.height / info.size.height;

        if (visibleFraction >=
            (widgetToScreenFraction > 1 ? 1 : widgetToScreenFraction) * .1) {
          controller.forward();
        } else {
          //controller.reverse();
        }
      },
      child: SizedBox(
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: isVideoReady
                    ? SizedBox(
                        width: _videoPlayerController.value.size.width,
                        height: _videoPlayerController.value.size.height,
                        child: VideoPlayer(_videoPlayerController),
                      )
                    : AnimatedOpacity(
                        curve: Curves.easeIn,
                        opacity: appear == 1 ? 0.0 : 1.0,
                        duration: const Duration(milliseconds: 1750),
                        child: Container(
                          height: size.height,
                          width: size.width,
                          decoration: const BoxDecoration(color: Colors.black),
                        ),
                      ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.5, 1],
                  colors: [
                    const Color(0xFF000000).withOpacity(0.75),
                    const Color(0xFF000000).withOpacity(0.25),
                    const Color(0xFF000000).withOpacity(0),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.width > 1000 ? CHGrid.xxxxxxLarge : 30,
                        ),
                        Image.asset(
                          'assets/icons/ants-finalfinal.png',
                          height: size.width > 1000 ? 150 : 50,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(
                          height: size.width > 1000 ? CHGrid.large : 15,
                        ),
                        // SvgPicture.asset(
                        //   'images/group2.svg',
                        //   height: size.width > 1000 ? 15 : 12,
                        // ),
                        SizedBox(
                          height: size.width > 1000 ? CHGrid.medium : 10,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: SvgPicture.asset(
                      'images/arrow_down.svg',
                      height: size.width > 1000 ? 20 : 10,
                      width: 1,
                    ),
                  ),
                  SizedBox(height: size.width > 1000 ? 100 : 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
