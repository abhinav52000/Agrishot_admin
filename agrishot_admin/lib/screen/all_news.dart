import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Theme/text_style.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key, required this.tabName});

  final String tabName;

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffDFE0EB), width: 2),
          color: const Color(0xffFFFFFF),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    widget.tabName,
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
          ],
        ),
      ),
    );
  }
}
