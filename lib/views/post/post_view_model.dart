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

  setThisPost(Post post) {
    _currentPost = post;
  }

  Future<bool> hasLiked() async {
    User user = await UserPreferences().getUser();
    if (currentPost!.likes!.contains(user.id)) {
      return true;
    } else {
      return false;
    }
  }

  // USELESS FUNCTION TILL NOW
  getThisPost(String postId) async {
    setState(ViewState.Busy);

    var res = await _api.getPostById(postId);
    if (res is Success) {
      _currentPost = Post.fromJson(res.response as Map<String, dynamic>);
    } else if (res is Failure) {
      print('Response is: ${res.errorResponse}');
    }

    setState(ViewState.Idle);
  }

  // USELESS FUNCTION TILL NOW
  /*
  likeThisPost(String postId) async {
    setState(ViewState.Busy);

    var token = await UserPreferences().getUserToken();
    if (token != null) {
      var res = await _api.likePost(postId, token);
      if (res is Success) {
        _currentPost = res.response as Post;
        PostView(
          post: _currentPost,
        );
        errorMessage = null;
      } else if (res is Failure) {
        errorMessage = res.errorResponse as String;
      }
    } else {
      errorMessage = 'User token expired or invalid';
    }

    setState(ViewState.Idle);
  }*/
}
