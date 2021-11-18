import 'package:folder_structure/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('id', user.id!);
    prefs.setString('name', user.name!);
    prefs.setString('email', user.email!);
    prefs.setString('password', user.password!);

    // print("User Saved Successfully");
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString('id');
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');

    // print("User Sent Successfully");
    return User(id: id, name: name, email: email, password: password);
  }

  removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('password');
  }
}
