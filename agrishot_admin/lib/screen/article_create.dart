import 'package:agrishot_admin/Theme/container_styling.dart';
import 'package:flutter/material.dart';

import '../Theme/text_style.dart';

class CreateArticle extends StatefulWidget {
  const CreateArticle({super.key});

  @override
  State<CreateArticle> createState() => _CreateArticleState();
}

class _CreateArticleState extends State<CreateArticle> {
  bool _sendNotification = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffDFE0EB), width: 2),
          color: const Color(0xffFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    'New Article',
                    style: homeScreenTextStyle.copyWith(
                        fontSize: 19, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            TextField(
              decoration: inputDecorationfortextfield.copyWith(
                  labelText: 'Category',
                  constraints: const BoxConstraints.tightFor(width: 400)),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: inputDecorationfortextfield.copyWith(
                  labelText: 'Title',
                  constraints: const BoxConstraints.tightFor(width: 400)),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: inputDecorationfortextfield.copyWith(
                  labelText: 'Image URL',
                  constraints: const BoxConstraints.tightFor(width: 400)),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: inputDecorationfortextfield.copyWith(
                  labelText: 'Source URL',
                  constraints: const BoxConstraints.tightFor(width: 400)),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: inputDecorationfortextfield.copyWith(
                  labelText: 'Short Content',
                  constraints: const BoxConstraints.tightFor(width: 400)),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text('Send Push Notification',
                    style: homeScreenTextStyle.copyWith(
                        fontWeight: FontWeight.bold)),
                Checkbox(
                    value: _sendNotification,
                    onChanged: (value) {
                      setState(() {
                        _sendNotification = !_sendNotification;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
