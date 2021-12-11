import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/services/api.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:folder_structure/utils/base_view_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';

class HomeViewModel extends BaseViewModel {
  final Api _api = Api();
  List<Post> _postList = [];
  List<Post> get postList => _postList;
  String? errorMessage;

  HomeViewModel() {
    fetchAllPosts();
  }

  fetchAllPosts() async {
    setState(ViewState.Busy);

    var res = await _api.getPosts();

    if (res is Success) {
      _postList = res.response as List<Post>;
    } else if (res is Failure) {
      print('Response is: ${res.errorResponse}');
    }

    setState(ViewState.Idle);
  }

  likeThisPost(String postId) async {
    setState(ViewState.Busy);

    var token = await UserPreferences().getUserToken();
    if (token != null) {
      var res = await _api.likePost(postId, token);
      if (res is Success) {
        Post currentPost = res.response as Post;
        _postList = _postList
            .map((post) => post.id != postId ? post : currentPost)
            .toList();
        errorMessage = null;
      } else if (res is Failure) {
        errorMessage = res.errorResponse as String;
      }
    } else {
      errorMessage = 'User token expired or invalid';
    }

    setState(ViewState.Idle);
  }
}
