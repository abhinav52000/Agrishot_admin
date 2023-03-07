abstract class HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class OverviewState extends HomeScreenState {}

class AllNewsState extends HomeScreenState {}

class CategoriesState extends HomeScreenState {}

class EditorsOrAuthorState extends HomeScreenState {}

class UsersState extends HomeScreenState {}

class PublishedArticleState extends HomeScreenState {}

class CreateArticleState extends HomeScreenState {}

class HomeScreenErrorState extends HomeScreenState {
  final String error;
  HomeScreenErrorState(this.error);
}
