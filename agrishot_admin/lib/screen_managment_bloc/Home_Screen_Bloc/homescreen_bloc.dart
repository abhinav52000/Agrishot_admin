import 'package:agrishot_admin/screen_managment_bloc/Home_Screen_Bloc/homescreen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenLoadingState());

  void currentScreen({required String screenName}) {
    if (screenName == "Overview") {
      emit(OverviewState());
    }
    if (screenName == "All News") {
      emit(AllNewsState());
    }
    if (screenName == "published article") {
      emit(PublishedArticleState());
    }

    if (screenName == "Create Article") {
      emit(CreateArticleState());
    }
  }
}

//This will help in emitting the screen.
currentScreenCall({required BuildContext context, required String screenName}) {
  BlocProvider.of<HomeScreenCubit>(context)
      .currentScreen(screenName: screenName);
}
