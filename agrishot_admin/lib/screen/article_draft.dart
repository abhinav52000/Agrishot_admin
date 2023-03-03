import 'dart:convert';
import 'package:agrishot_admin/Network/Article_Api/get_articles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Network/Login_api/get_set_acceess_token.dart';
import '../Theme/text_style.dart';
import '../UI_components/article_card.dart';

class DraftArticle extends StatefulWidget {
  const DraftArticle({super.key, required this.currentPage});
  final int currentPage;
  @override
  State<DraftArticle> createState() => _DraftArticleState();
}

class _DraftArticleState extends State<DraftArticle> {
  String accessToken = '';
  List<dynamic> items = [];
  int page = 1;
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  var response;

  @override
  void initState() {
    super.initState();
    _loadMyValue(pagenumber: widget.currentPage);
    scrollController.addListener(() {
      _onScroll();
    });
  }

  _loadMyValue({required int pagenumber}) async {
    while (accessToken == '') {
      accessToken = await loadMyValue();
      setState(() {});
    }
    _fetchData();
  }

  _fetchData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      response = await getArticles(
          accessToken: accessToken.toString(), pageNumber: page++);

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
          response = jsonDecode(response.body);

          items.addAll(response['data']);
        });
      } else {
        throw Exception('Failed to load data');
      }
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
    if (response == null) {
      return const Center(child: CircularProgressIndicator());
    }
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
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index == items.length) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ArticleCard(
                    data: items[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
