// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ants/presentation/screens/sustainability/sustainabilty_articles/sustainability_article_widgets/sustainability_A.dart';
import 'package:ants/presentation/screens/sustainability/sustainabilty_articles/sustainability_article_widgets/sustainability_B.dart';
import 'package:ants/presentation/screens/sustainability/sustainabilty_articles/sustainability_article_widgets/sustainability_C.dart';
import 'package:ants/services/data/repositories/repositories.dart';
import 'package:ants/widgets/web/static_article.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';

import 'package:ants/widgets/web/dynamic_article/dynamic_article_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../services/bloc/sustainability_bloc/sustainability_bloc.dart';
import '../../../../services/data/models/sustainability_model.dart';
import '../../../../widgets/web/appbar.dart';
import '../../../../widgets/web/banner.dart';
import '../../../../widgets/web/drawer.dart';
import '../../../../widgets/web/dynamic_article/dynamic_article_widget/dynamic_article_banner.dart';
import '../../../../widgets/web/dynamic_article/dynamic_article_widget/dynamic_article_content.dart';
import '../../../../widgets/web/footer_section.dart';

class SustainabilityArticleScreen extends StatelessWidget {
  final String id;
  const SustainabilityArticleScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

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
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: BlocBuilder<SustainabilityBloc, SustainabilityState>(
                  builder: (context, state) {
                if (state is SustainabilityLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SustainabilityLoadedState) {
                  List<SustainabilityModel> sustainability =
                      state.sustainability;
                  int path = int.parse(id);
                  print(id.toString() + " ZZZZ");

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DynamicArticleBanner(
                        imagePath: sustainability[path].image!,
                      ),
                      Column(children: [
                        DynamicArticleContent(
                            contentTitle: sustainability[path].title!,
                            contentBody: ''),
                        id == '3'
                            ? const SustainabilityA()
                            : id == '4'
                                ? const SustainabilityB()
                                : const SustainabilityC()
                      ]),
                      const SizedBox(
                        height: 100,
                      ),
                      const FooterSection(),
                    ],
                  );
                } else {
                  return const Text('Error');
                }
              }),
            ),
          )),
    );
  }
}
