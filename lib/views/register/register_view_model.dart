import 'package:folder_structure/models/user_model.dart';
import 'package:folder_structure/services/api.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:folder_structure/utils/base_view_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';

class RegisterViewModel extends BaseViewModel {
  final Api _api = Api();

  User? _currentUser;
  User? get currentUser => _currentUser;

  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;
  String? _confirmPassword;

  setFirstName(String firstName) {
    _firstName = firstName;
  }

  setLastName(String lastName) {
    _lastName = lastName;
  }

  setEmail(String email) {
    _email = email;
  }

  setPassword(String password) {
    _password = password;
  }

  setConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
  }

  String? errorMessage;
  bool isLoggedIn = false;

  bool parametersNotNull() {
    if (_firstName != null &&
        _lastName != null &&
        _email != null &&
        _password != null &&
        _confirmPassword != null) {
      return true;
    } else {
      return false;
    }
  }

  bool isEmailValid() {
    String emailExpression =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    if (!RegExp(emailExpression).hasMatch(_email!)) {
      return false;
    } else {
      return true;
    }
  }

  userRegister() async {
    setState(ViewState.Busy);

    if (parametersNotNull()) {
      if (!isEmailValid()) {
        errorMessage = 'Email Invalid';
      } else {
        var res = await _api.register(
            _firstName!, _lastName!, _email!, _password!, _confirmPassword!);
        if (res is Success) {
          _currentUser = res.response as User;
          UserPreferences().saveUser(_currentUser!);
          errorMessage = null;
          isLoggedIn = true;
        } else if (res is Failure) {
          errorMessage = res.errorResponse as String;
          print(
              'Error in userRegister Function: code: ${res.code} errorResponse: ${res.errorResponse}');
        }
      }
    } else {
      errorMessage = 'Parameters Cannot be empty';
    }

    setState(ViewState.Idle);
  }
}
