import 'package:ants/presentation/screens/news/news_content_section.dart';
import 'package:ants/services/data/repositories/repositories.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/bloc/news_article_bloc/news_article_bloc.dart';

class CHNewsPage extends StatefulWidget {
  const CHNewsPage({Key? key}) : super(key: key);

  @override
  State<CHNewsPage> createState() => _CHNewsPageState();
}

class _CHNewsPageState extends State<CHNewsPage> {
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

    return BlocProvider(
      create: (context) =>
          NewsArticleBloc(RepositoryProvider.of<ChromaRepository>(context))
            ..add(LoadNewsArticleEvent()),
      child: Scaffold(
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
                children: const [
                  CHBanner(
                    imagePath: 'images/news-banner.webp',
                    title: 'NEWS',
                    body: '',
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  NewsContentSection(),
                  FooterSection(),
                ],
              ),
            ),
          )),
    );
  }
}
