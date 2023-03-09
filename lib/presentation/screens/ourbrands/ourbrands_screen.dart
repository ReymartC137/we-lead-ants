// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ourbrands.dart';

class CHOurBrands extends StatefulWidget {
  const CHOurBrands({super.key});

  @override
  State<CHOurBrands> createState() => _CHOurBrandsState();
}

class _CHOurBrandsState extends State<CHOurBrands> {
  final List<Widget> sections = [
    const CrimsonSection(),
    const FoodBeveragesSection(),
    const GolfAndActiveLifeStyleSection(),
  ];
  int selectedIndex = 0;

  int scrollDuration = 550;
  int scrollHeight = 550;
  final ScrollController scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  void _handleKeyEvent(RawKeyEvent event) {
    var offset = scrollController.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        scrollController.animateTo(offset - scrollHeight,
            duration: Duration(milliseconds: scrollDuration),
            curve: Curves.ease);
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        scrollController.animateTo(offset + scrollHeight,
            duration: Duration(milliseconds: scrollDuration),
            curve: Curves.ease);
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
    final Size size = MediaQuery.of(context).size;
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
            child: Column(
              children: [
                const CHBanner(
                  imagePath: 'images/our-brands-banner.webp',
                  title: 'OUR BRANDS',
                  body:
                      'An interesting mix of Filipino lifestyle brands that highlight world-class facilities, warm service in premier locations.',
                ),
                const SizedBox(height: 20),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: _buildTabButtons(),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: animation.drive(
                          Tween(
                            begin: const Offset(0, .1),
                            end: Offset.zero,
                          ),
                        ),
                        child: child,
                      ),
                    );
                  },
                  layoutBuilder: (currentChild, previousChildren) {
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        ...previousChildren,
                        currentChild ?? const SizedBox(),
                      ],
                    );
                  },
                  child: sections[selectedIndex],
                ),
                const FooterSection(),
              ],
            ),
          ),
        ));
  }

  Row _buildTabButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: OurBrandsTabButton(
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            child: const Text(
              'HOTELS',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
          child: VerticalDivider(thickness: 2),
        ),
        Expanded(
          child: OurBrandsTabButton(
            onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            child: const AutoSizeText(
              'FOOD & BEVERAGES',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
          child: VerticalDivider(thickness: 2),
        ),
        Expanded(
          child: OurBrandsTabButton(
            onPressed: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            child: const AutoSizeText(
              'GOLF & ACTIVE LIFESTYLE',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class OurBrandsTabButton extends StatelessWidget {
  const OurBrandsTabButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w100,
          ),
          maximumSize: const Size.fromWidth(200),
        ),
        child: child);
  }
}
