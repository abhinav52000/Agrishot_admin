import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Network/Article_Api/Article_cubit/get_article_cubit.dart';
import '../Network/Article_Api/Article_cubit/get_article_state.dart';
import '../Network/Login_api/get_set_acceess_token.dart';
import '../Theme/text_style.dart';
import '../UI_components/article_card.dart';

class DraftArticle extends StatefulWidget {
  const DraftArticle({super.key});
  @override
  State<DraftArticle> createState() => _DraftArticleState();
}

class _DraftArticleState extends State<DraftArticle> {
  String accessToken = '';
  int page = 0;
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List articles = [];

  @override
  void initState() {
    super.initState();
    _loadMyValue();
    scrollController.addListener(() {
      _onScroll();
    });
  }

  _loadMyValue() async {
    while (accessToken == '') {
      accessToken = await loadMyValue();
    }
    setState(() {});
    _fetchData();
  }

  _fetchData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      setState(() {
        isLoading = false;
        BlocProvider.of<ArticleCubit>(context)
            .fetchArticles(accessToken: accessToken, pageNumber: ++page);
      });
    }
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _fetchData();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffDFE0EB), width: 2),
          color: const Color(0xffFFFFFF),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Text(
                      'Drafts',
                      style: homeScreenTextStyle.copyWith(
                          fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: const Icon(
                        CupertinoIcons.sort_up,
                        color: Color(0xffC5C7CD),
                      ),
                      title: Text(
                        'Sort',
                        style: homescreenContainerTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff4B506D),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: const Icon(
                        Icons.filter_alt_sharp,
                        color: Color(0xffC5C7CD),
                      ),
                      title: Text(
                        'Filter',
                        style: homescreenContainerTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff4B506D),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: RawMaterialButton(
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  fillColor: const Color(0xff1D8D2F),
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "New Article ",
                          style: homescreenContainerTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const WidgetSpan(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Text('News Detail',
                        style: homescreenContainerTextStyle,
                        textAlign: TextAlign.center)),
                Expanded(
                    child: Text('Author',
                        style: homescreenContainerTextStyle,
                        textAlign: TextAlign.center)),
                Expanded(
                    child: Text('Date',
                        style: homescreenContainerTextStyle,
                        textAlign: TextAlign.center)),
                Expanded(
                    child: Text(
                  'Status',
                  style: homescreenContainerTextStyle,
                )),
              ],
            ),
            const SizedBox(height: 5),
            BlocBuilder<ArticleCubit, ArticleState>(builder: (context, state) {
              if (state is ArticleLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.green),
                );
              }

              if (state is ArticleHoldState) {
                return infiniteListView();
              }

              if (state is ArticleLoadedState) {
                articles.addAll(state.articles);
                return infiniteListView();
              }

              return const Center(
                child: Text('There is an error'),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget infiniteListView() {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: articles.length + 1,
        itemBuilder: (context, index) {
          if (index == articles.length) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return ArticleCard(
            data: articles[index],
          );
        },
      ),
    );
  }
}
