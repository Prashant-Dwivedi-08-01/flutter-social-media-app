import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/services/api.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/utils/base_view_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';

class ProfileViewModel extends BaseViewModel {
  String? errorMessage;
  List<Post> _postListOfUser = [];
  final Api _api = Api();

  List<Post> get postListOfUser => _postListOfUser;

  //CONSTRUCTOR WHEN WE WANT TO RUN A MEHTOD WHEN THE VIEW CORRESPONDING TO THIS PARTICULAR
  // VIEWMODEL IS CALLED. ALTHOUGH WE HAVE RESTRICTION OF NOT BEING ABLE TO SEND THE PARAMETER

  getPostByUserId(String? userId) async {
    setState(ViewState.Busy);

    if (userId != null) {
      var res = await _api.getPostByUserId(userId);
      if (res is Success) {
        _postListOfUser = res.response as List<Post>;
      } else if (res is Failure) {
        errorMessage = res.errorResponse as String;
      }
    } else {
      errorMessage = 'User Id is null';
    }

    setState(ViewState.Idle);
  }
}
