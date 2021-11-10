// class Post {
//   String? title;
//   String? message;
//   String? name;
//   String? creator;
//   List<String>? tags;
//   String? selectedFile;
//   List<String>? likes;
//   List<String>? comments;
//   DateTime? createdAt;

//   Post(
//       {this.title,
//       this.message,
//       this.name,
//       this.creator,
//       this.tags,
//       this.selectedFile,
//       this.likes,
//       this.comments,
//       this.createdAt});

//   Post.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     message = json['message'];
//     name = json['name'];
//     creator = json['creator'];
//     tags = json['tags'];
//     selectedFile = json['selectedFile'];
//     likes = json['likes'];
//     comments = json['comments'];
//     createdAt = json['createdAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['title'] = title;
//     data['message'] = message;
//     data['name'] = name;
//     data['creator'] = creator;
//     data['tags'] = tags;
//     data['selectedFile'] = selectedFile;
//     data['likes'] = likes;
//     data['comments'] = comments;
//     data['createdAt'] = createdAt;

//     return data;
//   }
// }
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(List posts) =>
    List<Post>.from(posts.map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post(
      {this.tags,
      this.likes,
      this.comments,
      this.createdAt,
      this.title,
      this.message,
      this.selectedFile,
      this.name,
      this.creator,
      this.id});

  List<String>? tags;
  List<String>? likes;
  List<String>? comments;
  DateTime? createdAt;
  String? title;
  String? message;
  String? selectedFile;
  String? name;
  String? creator;
  String? id;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      tags: List<String>.from(json["tags"].map((x) => x)),
      likes: List<String>.from(json["likes"].map((x) => x)),
      comments: List<String>.from(json["comments"].map((x) => x)),
      createdAt: DateTime.parse(json["createdAt"]),
      title: json["title"],
      message: json["message"],
      selectedFile: json["selectedFile"],
      name: json["name"],
      creator: json["creator"],
      id: json["_id"]);

  Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "comments": List<dynamic>.from(comments!.map((x) => x)),
        "createdAt": createdAt,
        "title": title,
        "message": message,
        "selectedFile": selectedFile,
        "name": name,
        "creator": creator,
      };
}
