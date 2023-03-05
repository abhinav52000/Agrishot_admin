import 'dart:convert';
import 'package:agrishot_admin/Network/Article_Api/aticle_model.dart';
import 'package:http/http.dart' as http;
import '../api_list.dart';

class ArticleRepositary {
  Future<List<ArticleModel>> fetchArticles(
      {required String accessToken, required int pageNumber}) async {
    try {
      Uri articleUrl = Uri.parse(baseUrl + articlePath(pageNumber));
      http.Response response = await http.get(
        articleUrl,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      List<dynamic> articleMaps = jsonDecode(response.body)['data'];

      return articleMaps
          .map((articleMap) => ArticleModel.fromJson(articleMap))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}
