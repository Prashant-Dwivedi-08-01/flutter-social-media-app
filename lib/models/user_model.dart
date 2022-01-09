class User {
  String? id;
  String? name;
  String? email;
  String? password;
  List<String>? bucketList;

  User({this.id, this.name, this.email, this.password, this.bucketList});

  User.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        email = json['email'],
        password = json['password'],
        bucketList = List<String>.from(json['bucketList'].map((x) => x));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['bucketList'] = List<dynamic>.from(bucketList!.map((x) => x));
    return data;
  }
}
