import 'dart:convert';
import 'package:http/http.dart';

class BlogManager {
  BlogManager._privateConstructor();
  static final instance = BlogManager._privateConstructor();

  Future<Map<String, dynamic>> getPosts() async {
    final response = await get(Uri.parse(
        "https://firebasestorage.googleapis.com/v0/b/panacea-ss.appspot.com/o/data.json?alt=media&token=acbf6b81-e7db-4bd5-a326-d6fbe3ac29f8"));
    final json = jsonDecode(response.body);
    return json as Map<String, dynamic>;
  }
}
