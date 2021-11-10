import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/services/request_status.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  var client = http.Client();

  String baseUrl = 'https://my-memos-app.herokuapp.com';

  Future<Object> getPosts() async {
    try {
      var url = Uri.parse('$baseUrl/posts?page=2');

      var response = await client.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Success(
            code: response.statusCode, response: postFromJson(data['data']));
      } else {
        return Failure(
            code: response.statusCode, errorResponse: "Invalid Response");
      }
    } catch (e) {
      return Failure(
          code: 500, errorResponse: "Something went wrong client side");
    }
  }

  Future<Object> getPostById(String postId) async {
    try {
      var url = Uri.parse('$baseUrl/posts/$postId');
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Success(code: response.statusCode, response: data);
      } else {
        return Failure(
            code: response.statusCode, errorResponse: "Post not fetched");
      }
    } catch (e) {
      return Failure(
          code: 500, errorResponse: "Something went wrong client side");
    }
  }
}
