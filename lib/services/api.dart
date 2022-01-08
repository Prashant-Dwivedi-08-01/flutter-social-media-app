import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/models/user_model.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/services/user_prefrences.dart';
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
        print(data['data']);
        return Success(
            code: response.statusCode, response: postFromJson(data['data']));
      } else {
        return Failure(
            code: response.statusCode, errorResponse: "Invalid Response");
      }
    } catch (e) {
      return Failure(
          code: 500,
          errorResponse:
              "Something went wrong client side in Get all the posts: $e");
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
          code: 500,
          errorResponse: "Something went wrong-message from client side");
    }
  }

  Future<Object> login(String email, String password) async {
    try {
      var url = Uri.parse('$baseUrl/user/signin');
      var body = {
        "email": email,
        "password": password,
      };

      var response = await client.post(url, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data['token']);
        return Success(
            code: response.statusCode,
            response: User.fromJson(data['result']),
            token: data['token']);
      } else {
        var data = jsonDecode(response.body);
        return Failure(
            code: response.statusCode, errorResponse: data['message']);
      }
    } catch (e) {
      return Failure(
          code: 500,
          errorResponse: "Something went wrong-message from client side");
    }
  }

  Future<Object> register(String firstName, String lastName, String email,
      String password, String confirmPassword) async {
    try {
      var url = Uri.parse('$baseUrl/user/signup');
      var body = {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword
      };

      var response = await client.post(url, body: body);
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);

        return Success(
            code: response.statusCode, response: User.fromJson(data['result']));
      } else {
        var data = jsonDecode(response.body);
        return Failure(
            code: response.statusCode, errorResponse: data['message']);
      }
    } catch (e) {
      return Failure(
          code: 500,
          errorResponse: "Something went wrong-message from client side");
    }
  }

  Future<Object> createPost(Map<String, dynamic> post, String token) async {
    try {
      var url = Uri.parse('$baseUrl/posts/');
      User user = await UserPreferences().getUser();

      var rawJson = jsonEncode({...post, "name": user.name});

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type':
            "application/json" // THIS IS IMPORTANT WHEN WE ARE SENDING THE RAW JSON AS BODY
      };

      var response = await client.post(url, body: rawJson, headers: headers);

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return Success(
            code: response.statusCode, response: Post.fromJson(data));
      } else {
        var data = jsonDecode(response.body);
        return Failure(
            code: response.statusCode, errorResponse: data['message']);
      }
    } catch (e) {
      return Failure(
          code: 500,
          errorResponse: "Something went wrong-message from client side: $e");
    }
  }

  Future<Object> getPostByUserId(String userId) async {
    try {
      var url = Uri.parse('$baseUrl/posts/user/$userId');
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Success(
            code: response.statusCode, response: postFromJson(data['data']));
      } else {
        var data = jsonDecode(response.body);
        return Failure(
            code: response.statusCode, errorResponse: data['message']);
      }
    } catch (e) {
      return Failure(
          code: 500,
          errorResponse: "Something went wrong-message from client side: $e");
    }
  }

  Future<Object> likePost(String postId, String token) async {
    try {
      var url = Uri.parse('$baseUrl/posts/$postId/likePost');
      var headers = {
        'Authorization': 'Bearer $token',
      };

      var response = await client.patch(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Success(
            code: response.statusCode, response: Post.fromJson(data));
      } else {
        var data = jsonDecode(response.body);
        return Failure(
            code: response.statusCode, errorResponse: data['message']);
      }
    } catch (e) {
      return Failure(
          code: 500,
          errorResponse: "Something went wrong-message from client side: $e");
    }
  }

  Future<Object> commentPost(
      String postId, String comment, String token) async {
    try {
      var url = Uri.parse('$baseUrl/posts/$postId/comment');
      var headers = {'Authorization': 'Bearer $token'};
      var body = {'comment': comment};

      var response = await client.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return Success(
            code: response.statusCode, response: Post.fromJson(data));
      } else {
        var data = jsonDecode(response.body);
        return Failure(
            code: response.statusCode, errorResponse: data['message']);
      }
    } catch (e) {
      return Failure(
          code: 500,
          errorResponse: "Something went wrong-message from client side: $e");
    }
  }
}
