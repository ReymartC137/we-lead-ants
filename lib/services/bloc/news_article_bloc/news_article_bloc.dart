import 'package:bloc/bloc.dart';
import 'package:ants/services/data/models/NewsArticleModel.dart';
import 'package:ants/services/data/repositories/repositories.dart';
import 'package:equatable/equatable.dart';

part 'news_article_event.dart';
part 'news_article_state.dart';

class NewsArticleBloc extends Bloc<NewsArticleEvent, NewsArticleState> {
  final ChromaRepository newsArticleRepository;
  NewsArticleBloc(this.newsArticleRepository)
      : super(NewsArticleLoadingState()) {
    on<LoadNewsArticleEvent>((event, emit) async {
      emit(NewsArticleLoadingState());
      try {
        final newsArticle = await newsArticleRepository.getNewsArticle();
        print("NEWS:::" + newsArticle.toString());
        emit(NewsArticleLoadedState(newsArticle));
      } catch (e) {
        emit(NewsArticleErrorState(e.toString()));
      }
    });
  }
}
