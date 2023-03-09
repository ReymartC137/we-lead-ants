import 'package:ants/presentation/screens/whoweare/whoweare.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CHWhoWeArePage extends StatefulWidget {
  const CHWhoWeArePage({Key? key}) : super(key: key);

  @override
  State<CHWhoWeArePage> createState() => _CHWhoWeArePageState();
}

class _CHWhoWeArePageState extends State<CHWhoWeArePage> {
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
    return Scaffold(
      backgroundColor: Colors.white,
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
                  imagePath: 'images/CFCM - Swimming Pool 1.webp',
                  title: 'DRIVEN HOSPITALITY',
                  body:
                      'Chroma is a leading management group that focuses on customer experience while incorporating the expertise of team to innovate how things are done in the hotel and food & beverage industry.'),
              OurPromiseSection(size: size),
              const CoreValuesSectionResponsive(),
              const FooterSection()
            ],
          ),
        ),
      ),
    );
  }
}
