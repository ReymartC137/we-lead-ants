part of 'news_article_bloc.dart';

abstract class NewsArticleEvent extends Equatable {
  const NewsArticleEvent();
}

class LoadNewsArticleEvent extends NewsArticleEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
