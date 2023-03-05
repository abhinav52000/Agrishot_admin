import 'package:agrishot_admin/Theme/text_style.dart';
import 'package:agrishot_admin/UI_components/date_widget.dart';
import 'package:flutter/material.dart';

import '../Network/Article_Api/aticle_model.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({super.key, required this.data});
  final ArticleModel data;

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.green),
      )),
      constraints: const BoxConstraints.tightFor(height: 130),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                    widget.data.mediaslug ?? '',
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                    height: 100,
                  ),
                ),
                // const SizedBox(width: 5),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.data.title ?? '',
                      style: newsDetailTextStyle,
                      maxLines: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Text(widget.data.author ?? '')),
          Expanded(child: dateWidget(text: widget.data.createdAt ?? '')),
          const Expanded(child: Text('Draft / Published')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
    );
  }
}
