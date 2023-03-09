part of 'news_article_bloc.dart';

abstract class NewsArticleState extends Equatable {
  const NewsArticleState();
}

class NewsArticleLoadingState extends NewsArticleState {
  @override
  List<Object> get props => [];
}

class NewsArticleLoadedState extends NewsArticleState {
  final List<NewsArticleModel> newsArticleModel;

  NewsArticleLoadedState(this.newsArticleModel);
  @override
  List<Object> get props => [newsArticleModel];
}

class NewsArticleErrorState extends NewsArticleState {
  final String error;

  NewsArticleErrorState(this.error);

  @override
  List<Object> get props => [error];
}
