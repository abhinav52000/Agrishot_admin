import 'package:agrishot_admin/Network/Article_Api/Article_cubit/get_article_state.dart';
import 'package:agrishot_admin/Network/Article_Api/aticle_model.dart';
import 'package:agrishot_admin/Network/Article_Api/get_articles_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleCubit extends Cubit<ArticleState> {
  late String accessToken;
  ArticleCubit() : super(ArticleLoadingState()) {
    // fetchArticles();
  }

  ArticleRepositary articleRepositary = ArticleRepositary();

  void fetchArticles(
      {required String accessToken, required int pageNumber}) async {
    try {
      emit(ArticleHoldState());
      List<ArticleModel> articles = await articleRepositary.fetchArticles(
          accessToken: accessToken, pageNumber: pageNumber);

      emit(ArticleLoadedState(articles));
    } catch (ex) {
      emit(ArticleErrorState(
          "Can't fetch Articles, please check your internet connection!"));
    }
  }
}
