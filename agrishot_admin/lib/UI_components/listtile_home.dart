import 'package:flutter/material.dart';
import '../Theme/text_style.dart';
import '../constant/home_screen_constant.dart';

class CustomizedTile extends StatefulWidget {
  const CustomizedTile(
      {super.key,
      required this.leadingIcon,
      required this.tileNumber,
      required this.tileName,
      this.tileFunction});

  final IconData leadingIcon;
  final int tileNumber;
  final String tileName;
  final Function()? tileFunction;

  @override
  State<CustomizedTile> createState() => _CustomizedTileState();
}

class _CustomizedTileState extends State<CustomizedTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ListTile(
          leading: Icon(
            widget.leadingIcon,
            color: selectedtile[widget.tileNumber - 1]
                ? const Color(0xffDDE2FF)
                : const Color(0xffA4A6B3),
          ),
          title: Text(
            widget.tileName,
            style: selectedtile[widget.tileNumber - 1]
                ? selectedTileTextStyle
                : tileTextStyle,
          ),
          onTap: () {
            widget.tileFunction;
          }),
    );
  }
}
