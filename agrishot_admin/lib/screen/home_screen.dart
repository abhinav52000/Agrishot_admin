import 'package:agrishot_admin/Screen/article_draft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Network/Article_Api/Article_cubit/get_article_cubit.dart';
import '../Theme/text_style.dart';
import '../UI_components/listtile_home.dart';
import '../constant/home_screen_constant.dart';
import 'all_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const id = "Home Screen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String tabName = 'Overview';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(
                30,
              ),
              color: const Color(
                0xff363740,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListTile(
                      leading: Image.asset(
                        'Asset/logo.png',
                        scale: 5,
                      ),
                      title: Text(
                        'AgriShots',
                        style: loginPageStyle.copyWith(
                          fontSize: 0.01236 * width,
                          color: const Color(
                            0xffA4A6B3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTapCancel: (() {
                        setState(() {
                          tabName = 'Overview';
                          selectedtile = List.filled(8, false);
                          selectedtile[0] = true;
                        });
                      }),
                      child: CustomizedTile(
                        tileNumber: 1,
                        leadingIcon: CupertinoIcons.chart_pie_fill,
                        tileName: 'Overview',
                        tileFunction: (() {}),
                      ),
                    ),
                    GestureDetector(
                      onTapCancel: (() {
                        setState(() {
                          tabName = 'All News';
                          selectedtile = List.filled(8, false);
                          selectedtile[1] = true;
                        });
                      }),
                      child: CustomizedTile(
                        tileNumber: 2,
                        leadingIcon: CupertinoIcons.news,
                        tileName: 'All News',
                        tileFunction: (() {}),
                      ),
                    ),
                    GestureDetector(
                      onTapCancel: (() {
                        setState(() {
                          tabName = 'Categories';
                          selectedtile = List.filled(8, false);
                          selectedtile[2] = true;
                        });
                      }),
                      child: CustomizedTile(
                        tileNumber: 3,
                        leadingIcon: CupertinoIcons.lightbulb_fill,
                        tileName: 'Categories',
                        tileFunction: (() {}),
                      ),
                    ),
                    GestureDetector(
                      onTapCancel: (() {
                        setState(() {
                          tabName = 'Editors/Authors';
                          selectedtile = List.filled(8, false);
                          selectedtile[3] = true;
                        });
                      }),
                      child: CustomizedTile(
                        tileNumber: 4,
                        leadingIcon: Icons.groups_2_sharp,
                        tileName: 'Editors/Authors',
                        tileFunction: (() {}),
                      ),
                    ),
                    GestureDetector(
                      onTapCancel: (() {
                        setState(() {
                          tabName = 'Users';
                          selectedtile = List.filled(8, false);
                          selectedtile[4] = true;
                        });
                      }),
                      child: CustomizedTile(
                        tileNumber: 5,
                        leadingIcon: Icons.person_2_rounded,
                        tileName: 'Users',
                        tileFunction: (() {}),
                      ),
                    ),
                    GestureDetector(
                      onTapCancel: (() {
                        setState(() {
                          tabName = 'Articles';
                          selectedtile = List.filled(8, false);
                          selectedtile[5] = true;
                        });
                      }),
                      child: CustomizedTile(
                        tileNumber: 6,
                        leadingIcon: Icons.menu_book_sharp,
                        tileName: 'Articles',
                        tileFunction: (() {}),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      height: 10,
                      color: Color(0xffDFE0EB),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTapCancel: (() {
                        setState(() {
                          tabName = 'Settings';
                          selectedtile = List.filled(8, false);
                          selectedtile[6] = true;
                        });
                      }),
                      child: CustomizedTile(
                        tileNumber: 7,
                        leadingIcon: CupertinoIcons.settings,
                        tileName: 'Settings',
                        tileFunction: (() {}),
                      ),
                    ),
                    GestureDetector(
                      onTapCancel: (() {
                        setState(() {
                          tabName = 'Polls';
                          selectedtile = List.filled(8, false);
                          selectedtile[7] = true;
                        });
                      }),
                      child: CustomizedTile(
                        tileNumber: 8,
                        leadingIcon: Icons.poll_sharp,
                        tileName: 'Polls',
                        tileFunction: (() {}),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          tabName,
                          style: homeScreenTextStyle.copyWith(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.search,
                        color: Color(0xffC5C7CD),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.notifications,
                        color: Color(0xffC5C7CD),
                      ),
                      const SizedBox(width: 10),
                      Text('NickName', style: homeScreenTextStyle),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: const AssetImage('Asset/dp.png'),
                        onBackgroundImageError: (e, s) {
                          debugPrint('image issue, $e,$s');
                        },
                      )
                    ],
                  ),
                  Visibility(
                    visible: selectedtile[1],
                    child: AllNews(tabName: tabName),
                  ),
                  BlocProvider(
                    create: (context) => ArticleCubit(),
                    child: Visibility(
                      visible: selectedtile[5],
                      child: const DraftArticle(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
