import 'package:ants/services/data/models/NewsArticleModel.dart';
import 'package:ants/widgets/web/web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../services/bloc/news_article_bloc/news_article_bloc.dart';

class Article extends StatelessWidget {
  final int crossAxisRatio;
  final double imageSize;

  const Article({
    Key? key,
    required this.crossAxisRatio,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<NewsArticleBloc, NewsArticleState>(
      builder: (context, state) {
        if (state is NewsArticleLoadedState) {
          List<NewsArticleModel> news = state.newsArticleModel;
          print("::::::" + news.toString());
          return Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  width: 1400,
                  child: MasonryGridView.count(
                    crossAxisCount: crossAxisRatio,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        height: size.width > 1000 ? 600 : 400,
                        child: ArticleCard(
                            redirection_link: news[index].redirectionLink,
                            textAlign: TextAlign.center,
                            thumbnailUrl: news[index].image!,
                            title: news[index].newsTitle,
                            titleColor: Colors.blue,
                            description: news[index].newsBody!),
                      );
                    },
                    itemCount: CoreValuesData.data.length,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  ),
                )
              ],
            ),
          );
        } else if (state is NewsArticleLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsArticleErrorState) {
          return const Center(
            child: Text('error'),
          );
        }
        return Container();
      },
    );
  }
}
