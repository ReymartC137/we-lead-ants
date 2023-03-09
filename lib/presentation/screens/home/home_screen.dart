import 'package:ants/services/bloc/news_article_bloc/news_article_bloc.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/data/repositories/repositories.dart';
import 'home.dart';

class CHHomePage extends StatefulWidget {
  const CHHomePage({Key? key}) : super(key: key);

  @override
  State<CHHomePage> createState() => _CHHomePageState();
}

class _CHHomePageState extends State<CHHomePage> {
  bool showAppbar = false;
  int scrollDuration = 550;
  int scrollHeight = 550;
  late final ScrollController scrollController;

  final FocusNode _focusNode = FocusNode();
  final itemKey = GlobalKey();
  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        if (scrollController.offset >= MediaQuery.of(context).size.height &&
            !showAppbar) {
          setState(() {
            showAppbar = true;
          });
        } else if (scrollController.offset <
                MediaQuery.of(context).size.height &&
            showAppbar) {
          setState(() {
            showAppbar = false;
          });
        }
      });
    });
  }

  Future scrollToItem() async {
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(context,
        duration: const Duration(milliseconds: 800));
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
    Size size = MediaQuery.of(context).size;

    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => NewsArticleBloc(
                  RepositoryProvider.of<ChromaRepository>(context))
                ..add(LoadNewsArticleEvent()))
        ],
        child: Scaffold(
            drawerEnableOpenDragGesture: false,
            drawerEdgeDragWidth: 0,
            endDrawerEnableOpenDragGesture: false,
            extendBodyBehindAppBar: true,
            appBar: !showAppbar
                ? null
                : PreferredSize(
                    preferredSize: Size(size.width, 70),
                    child: const CHAppBar()),
            endDrawer: const CHDrawer(),
            body: RawKeyboardListener(
              autofocus: true,
              focusNode: _focusNode,
              onKey: _handleKeyEvent,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    ChromaSection(
                      isWeb: MediaQuery.of(context).size.width > 400,
                      onTap: () {
                        scrollToItem();
                      },
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            TopClearance(key: itemKey),
                            DrivenHospitalitySection(size: size),
                            OurBrandsSection(size: size),
                            BringingManegementSection(size: size),
                            SustainabilitySection(size: size),
                            // const NewsSection(),
                            const BrilliantOpportunitySection(),
                            BeUpdatedSection(size: size),
                            const FooterSection(),
                          ],
                        ),
                        if (!showAppbar)
                          const SizedBox(
                            height: 70,
                            child: CHAppBar(),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
