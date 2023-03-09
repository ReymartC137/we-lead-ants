// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ants/core/slide_fade_widget.dart';
import 'package:ants/services/data/models/NewsArticleModel.dart';
import 'package:ants/widgets/button.dart';
import 'package:ants/widgets/constants/constants.dart';
import 'package:ants/widgets/theme.dart';
import 'package:ants/widgets/web/article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../services/bloc/news_article_bloc/news_article_bloc.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 995 && constraints.maxWidth <= 1315) {
          return News(
            size: size,
            crossAxisRatio: 3,
            //imageSize: 100,
          );
        } else if (constraints.maxWidth <= 994 && constraints.maxWidth >= 870) {
          return News(
            size: size,
            crossAxisRatio: 1,
            //imageSize: 130,
          );
        } else if (constraints.maxWidth <= 866 && constraints.maxWidth >= 667) {
          return News(
            size: size,
            crossAxisRatio: 1,
            //imageSize: 100,
          );
        } else if (constraints.maxWidth <= 666) {
          return News(
            size: size,
            crossAxisRatio: 1,
            // imageSize: 130,
          );
        } else {
          return News(
            size: size,
            crossAxisRatio: 3,
            //imageSize: 160,
          );
        }
      }),
    );
  }
}

class News extends StatefulWidget {
  const News({
    Key? key,
    required this.size,
    required this.crossAxisRatio,
  }) : super(key: key);

  final Size size;
  final int crossAxisRatio;

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey('news-section-home'),
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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 0.0),
        child: Column(
          children: [
            AnimatedSlideFade(
              controller: controller,
              slideInitialPos: const Offset(0, .1),
              child: Text(
                "NEWS",
                style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    fontFamily: 'Baskerville',
                    fontSize: widget.size.width > 800 ? 48 : 32,
                    color: CHColor.primaryColor),
              ),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            BlocBuilder<NewsArticleBloc, NewsArticleState>(
              builder: (context, state) {
                if (state is NewsArticleLoadedState) {
                  List<NewsArticleModel> newsArticleModel =
                      state.newsArticleModel;
                  return AnimatedSlideFade(
                    controller: controller,
                    slideInitialPos: const Offset(0, .2),
                    child: SizedBox(
                      //width: 1300,
                      //height: size.width > 850 ? 700 : size.h,
                      child: MasonryGridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          //physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: widget.crossAxisRatio,
                          itemCount: 3,
                          itemBuilder: ((context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 55, vertical: 20),
                              child: ArticleCard(
                                thumbnailUrl: newsArticleModel[index].image!,
                                title: newsArticleModel[index].newsTitle!,
                                description: newsArticleModel[index].newsBody!,
                                redirection_link:
                                    newsArticleModel[index].redirectionLink,
                              ),
                            );
                          })),
                    ),
                  );
                } else if (state is NewsArticleLoadingState) {
                  return const CircularProgressIndicator();
                } else {
                  return const Text('Error');
                }
              },
            ),

            AnimatedSlideFade(
              controller: controller,
              slideInitialPos: const Offset(0, .1),
              child: CHButton(
                  name: 'KNOW MORE',
                  type: CHButtonType.blue,
                  onPressed: () {
                    context.go('/news');
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class NewsSectionCard extends StatelessWidget {
  const NewsSectionCard({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width > 1000 ? 300 : 200,
      // height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(imageUrl),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Lorem ipsum dolor sit amet onsectetuer adipiscing",
            style: size.width > 1000
                ? CHTheme.lightTheme.textTheme.titleMedium
                    ?.copyWith(color: Colors.blue)
                : CHTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text:
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet",
                style: size.width > 1000
                    ? CHTheme.lightTheme.textTheme.titleSmall
                    : CHTheme.lightTheme.textTheme.titleSmall
                        ?.copyWith(fontSize: 12),
              ),
            ]),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                text: "KNOW MORE",
                style: CHTheme.lightTheme.textTheme.titleSmall?.copyWith(
                  fontSize: size.width > 1000 ? 12 : 10,
                  color: CHColor.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
