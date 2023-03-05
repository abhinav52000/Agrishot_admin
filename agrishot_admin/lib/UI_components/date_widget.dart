import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget dateWidget({required String text}) {
  return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        DateFormatter().formattedDate(rawDate: text),
        style: const TextStyle(
          fontSize: 13,
        ),
      ));
}

class DateFormatter {
  String formattedDate({
    required String rawDate,
  }) {
    String date = DateFormat('MMM dd, hh:mm a').format(DateTime.parse(rawDate));
    return date;
  }
}
