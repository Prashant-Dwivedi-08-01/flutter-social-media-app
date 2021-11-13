import 'package:folder_structure/models/user_model.dart';
import 'package:folder_structure/services/api.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/utils/base_view_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';

class LoginViewModel extends BaseViewModel {
  final Api _api = Api();

  String? _email;
  String? _password;
  String? errorMessage;
  bool isLoggedIn = false;

  User? _currentUser;
  User? get currentUser => _currentUser;

  setEmail(String email) {
    _email = email;
    print(_email);
  }

  setPassword(String password) {
    _password = password;
  }

  userLogin() async {
    setState(ViewState.Busy);

    if (_email != null && _password != null) {
      String emailExpression =
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
      if (!RegExp(emailExpression).hasMatch(_email!)) {
        errorMessage = 'Email Invalid';
      } else {
        var res = await _api.login(_email!, _password!);

        if (res is Success) {
          _currentUser = res.response as User;
          errorMessage = null;
          isLoggedIn = true;
        } else if (res is Failure) {
          errorMessage = res.errorResponse as String;
          print(
              'Error in userLogin Function: code: ${res.code} errorResponse: ${res.errorResponse}');
        }
      }
    } else {
      errorMessage = 'Email or Password cannot be empty';
    }

    setState(ViewState.Idle);
  }
}
