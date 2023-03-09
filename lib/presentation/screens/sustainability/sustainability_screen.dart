import 'package:ants/services/data/models/sustainability_model.dart';
import 'package:ants/services/data/repositories/repositories.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/bloc/sustainability_bloc/sustainability_bloc.dart';
import 'sustainability.dart';

class CHSustainabilityPage extends StatefulWidget {
  const CHSustainabilityPage({Key? key}) : super(key: key);

  @override
  State<CHSustainabilityPage> createState() => _CHSustainabilityPageState();
}

class _CHSustainabilityPageState extends State<CHSustainabilityPage> {
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
          SustainabilityBloc(RepositoryProvider.of<ChromaRepository>(context))
            ..add(LoadSustainabilityEvent()),
      child: Scaffold(
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
              child: BlocBuilder<SustainabilityBloc, SustainabilityState>(
                builder: (context, state) {
                  if (state is SustainabilityLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SustainabilityLoadedState) {
                    List<SustainabilityModel> sustainability =
                        state.sustainability;
                    return Column(
                      children: [
                        const CHBanner(
                          imagePath: 'images/sustainability-banner.webp',
                          title: 'SUSTAINABILITY',
                          body:
                              'Our efforts for sustainability are evident in our hotels, resorts and dining establishments; from biodegrable straws, aiming for zero plastic materials, and farm-to-table initiatives, to more innovative ways of caring for the planet, we aim to pioneer the movement in the hospitality industry.',
                        ),
                        ArticleLeftRightSection(
                          id: '0',
                          imageUrl: sustainability[0].image!,
                          title: sustainability[0].title!,
                          description: sustainability[0].body!,
                        ),
                        ArticleRightLeftSection(
                          id: '1',
                          imageUrl: sustainability[1].image!,
                          title: sustainability[1].title!,
                          description: sustainability[1].body!,
                        ),
                        ArticleLeftRightSection(
                          id: '2',
                          imageUrl: sustainability[2].image!,
                          title: sustainability[2].title!,
                          description: sustainability[2].body!,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ),
                        const FooterSection(),
                      ],
                    );
                  } else {
                    return const Text('ERROR');
                  }
                },
              ),
            ),
          )),
    );
  }
}
