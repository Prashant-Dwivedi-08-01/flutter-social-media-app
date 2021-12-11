import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/models/user_model.dart';
import 'package:folder_structure/services/api.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:folder_structure/utils/base_view_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/post/post_view.dart';

class PostViewModel extends BaseViewModel {
  final Api _api = Api();
  Post? _currentPost;
  Post? get currentPost => _currentPost;
  String? errorMessage;
  bool? hasLiked;

  setThisPost(Post post) async {
    _currentPost = post;
    User user = await UserPreferences().getUser();
    if (_currentPost!.likes!.contains(user.id)) {
      hasLiked = true;
    } else {
      hasLiked = false;
    }
  }

  getThisPost(String postId) async {
    setState(ViewState.Busy);

    var res = await _api.getPostById(postId);
    if (res is Success) {
      _currentPost = Post.fromJson(res.response as Map<String, dynamic>);

      User user = await UserPreferences().getUser();

      if (_currentPost!.likes!.contains(user.id)) {
        hasLiked = true;
      } else {
        hasLiked = false;
      }
    } else if (res is Failure) {
      print('Response is: ${res.errorResponse}');
    }

    setState(ViewState.Idle);
  }
}
