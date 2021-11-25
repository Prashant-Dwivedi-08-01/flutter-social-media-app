import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/services/api.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:folder_structure/utils/base_view_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';

class CreatePostViewModel extends BaseViewModel {
  final Api _api = Api();
  Post? _createdPost;
  String? errorMessage;

  Post? get createdPost => _createdPost;

  createPost(Map<String, dynamic> post) async {
    setState(ViewState.Busy);

    String? token = await UserPreferences().getUserToken();

    if (token != null) {
      var res = await _api.createPost(post, token);
      if (res is Success) {
        _createdPost = res.response as Post;
        errorMessage = null;
      } else if (res is Failure) {
        errorMessage = res.errorResponse as String;
        print('Error in CreatePost Function: ${res.errorResponse}');
      }
    } else {
      errorMessage = 'User not authenticated with proper token';
    }

    setState(ViewState.Idle);
  }
}
