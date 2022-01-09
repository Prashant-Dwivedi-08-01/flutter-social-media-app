import 'package:folder_structure/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // USER INFORMATION
  saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('id', user.id!);
    prefs.setString('name', user.name!);
    prefs.setString('email', user.email!);
    prefs.setString('password', user.password!);
    prefs.setStringList('bucketList', user.bucketList!);
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString('id');
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    List<String>? bucketList = prefs.getStringList('bucketList');

    return User(
        id: id,
        name: name,
        email: email,
        password: password,
        bucketList: bucketList);
  }

  removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('password');
    prefs.remove('bucketList');
  }

  // TOKEN
  saveUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('token', token);
  }

  Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  removeUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('token');
  }
}
