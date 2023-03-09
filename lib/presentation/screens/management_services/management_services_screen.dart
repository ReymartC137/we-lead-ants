import 'package:ants/presentation/screens/management_services/our_leaders_section.dart';
import 'package:ants/presentation/screens/management_services/service_section_new.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class CHManagementPage extends StatefulWidget {
  const CHManagementPage({Key? key}) : super(key: key);

  @override
  State<CHManagementPage> createState() => _CHManagementPageState();
}

class _CHManagementPageState extends State<CHManagementPage> {
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
    ManagementService managementService;
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
                imagePath: 'images/IMG_5236 1.webp',
                title: 'MANAGEMENT SERVICES',
                body:
                    'Our executives are committed to innovating how hosptality is done while expanding the reach of our proudly Filipino brands.',
              ),
              //const ServiceSectionNew(),
              const ServiceSectionNew(),
              OurLeaderSection(size: size),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
