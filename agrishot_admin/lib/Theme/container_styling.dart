import 'package:flutter/material.dart';

import 'text_style.dart';

OutlineInputBorder registraionpagetilesborder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(
      10,
    ),
  ),
  borderSide: BorderSide(
    color: Colors.blueGrey,
    width: 0,
  ),
);

InputDecoration inputDecorationfortextfield = InputDecoration(
  focusedBorder: registraionpagetilesborder,
  enabledBorder: registraionpagetilesborder,
  hintStyle: loginPageStyle,
);
