import 'package:ants/presentation/screens/careers/jobs_near_your_section.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widgets/constants/constants.dart';
import '../../../widgets/widgets.dart';
import 'careers.dart';

class CHCareersPage extends StatefulWidget {
  const CHCareersPage({Key? key}) : super(key: key);

  @override
  State<CHCareersPage> createState() => _CHCareersPageState();
}

class _CHCareersPageState extends State<CHCareersPage> {
  int scrollDuration = 550;
  int scrollHeight = 550;
  final ScrollController scrollController = ScrollController();

  final FocusNode _focusNode = FocusNode();
  final itemKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    var offset = scrollController.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          scrollController.animateTo(offset - scrollHeight,
              duration: Duration(milliseconds: scrollDuration),
              curve: Curves.ease);
        } else {
          scrollController.animateTo(offset - scrollHeight,
              duration: Duration(milliseconds: scrollDuration),
              curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          scrollController.animateTo(offset + scrollHeight,
              duration: Duration(milliseconds: scrollDuration),
              curve: Curves.ease);
        } else {
          scrollController.animateTo(offset + scrollHeight,
              duration: Duration(milliseconds: scrollDuration),
              curve: Curves.ease);
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const double divider = 2;
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawerEdgeDragWidth: 0,
      endDrawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
          preferredSize: Size(size.width, 70), child: const CHAppBar()),
      endDrawer: const CHDrawer(),
      body: RawKeyboardListener(
        autofocus: true,
        focusNode: _focusNode,
        onKey: _handleKeyEvent,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const CHBanner(
                  imagePath: 'images/DEV01 DSC_8612b 1.webp',
                  title: 'CAREERS',
                  body: '  ',
                ),
                BrilliantOpportunitiesAwaitSection(size: size),
                ChooseYourPathSection(size: size),
                OurPromiseSection(size: size),
                SizedBox(
                  width: size.width * .85,
                  child: const Divider(
                    color: Colors.black,
                    height: divider,
                    thickness: divider,
                  ),
                ),
                JobsNearYouSection(size: size),
                SizedBox(
                    width: size.width * .8,
                    child: Column(
                      children: [
                        Text(
                          "CHROMA HOSPITALITY INC.",
                          style: CHTheme.lightTheme.textTheme.titleSmall
                              ?.copyWith(
                                  fontFamily: 'Baskerville',
                                  fontSize: size.width > 800 ? 38 : 22,
                                  color: CHColor.primaryColor),
                        ),
                        Image.asset('images/table1.webp'),
                      ],
                    )),
                const SizedBox(
                  height: 60,
                ),
                // SizedBox(
                //   width: size.width * .85,
                //   child: const Divider(
                //     color: Colors.black,
                //     height: divider,
                //     thickness: divider,
                //   ),
                // ),
                //LatestJobPostsSection(size: size),

                SizedBox(
                    width: size.width * .8,
                    child: Column(
                      children: [
                        Text(
                          "CRIMSON RESORT AND MACTAN SPA",
                          style: CHTheme.lightTheme.textTheme.titleSmall
                              ?.copyWith(
                                  fontFamily: 'Baskerville',
                                  fontSize: size.width > 800 ? 38 : 22,
                                  color: CHColor.primaryColor),
                        ),
                        Image.asset('images/table2.webp'),
                      ],
                    )),
                const SizedBox(
                  height: 60,
                ),

                SizedBox(
                    width: size.width * .8,
                    child: Column(
                      children: [
                        Text(
                          "CRIMSON HOTEL FILINVEST CITY, MANILA",
                          style: CHTheme.lightTheme.textTheme.titleSmall
                              ?.copyWith(
                                  fontFamily: 'Baskerville',
                                  fontSize: size.width > 800 ? 38 : 22,
                                  color: CHColor.primaryColor),
                        ),
                        Image.asset('images/table3.webp'),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: size.width * .85,
                  child: const Divider(
                    color: Colors.black,
                    height: divider,
                    thickness: divider,
                  ),
                ),
                LetsKeepInTouchSection(size: size),
                //FollowUsSection(size: size),
                const FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
