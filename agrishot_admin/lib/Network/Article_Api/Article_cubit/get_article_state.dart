import '../aticle_model.dart';

abstract class ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleLoadedState extends ArticleState {
  final List<ArticleModel> articles;
  ArticleLoadedState(this.articles);
}

class ArticleErrorState extends ArticleState {
  final String error;
  ArticleErrorState(this.error);
}

class ArticleHoldState extends ArticleState {}
