import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/models/user_model.dart';
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
  List<String> _bucketList = [];
  List<String> get bucketList => _bucketList;

  HomeViewModel() {
    fetchAllPostsAndSetBucketList();
  }

  // setBucketList() async {
  //   setState(ViewState.Busy);

  //   setState(ViewState.Idle);
  // }

  fetchAllPostsAndSetBucketList() async {
    setState(ViewState.Busy);

    var res = await _api.getPosts();

    if (res is Success) {
      _postList = res.response as List<Post>;

      var userData = await UserPreferences().getUser();
      _bucketList = userData.bucketList!;
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
        Post updatedPost = res.response as Post;
        _postList = _postList
            .map((post) => post.id != postId ? post : updatedPost)
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

  commentOnThisPost(String postId, String comment) async {
    setState(ViewState.Busy);

    var token = await UserPreferences().getUserToken();
    var user = await UserPreferences().getUser();
    if (token != null) {
      comment = '${user.name}: $comment';

      var res = await _api.commentPost(postId, comment, token);
      if (res is Success) {
        Post updatedPost = res.response as Post;
        _postList = _postList
            .map((post) => post.id != postId ? post : updatedPost)
            .toList();
      } else if (res is Failure) {
        errorMessage = res.errorResponse as String;
      }
    } else {
      errorMessage = 'User token expired or invalid';
    }

    setState(ViewState.Idle);
  }

  addThisPostToBucketList(String postId) async {
    // UserPreferences().saveUser();
    setState(ViewState.Busy);
    var token = await UserPreferences().getUserToken();
    if (token != null) {
      var res = await _api.addPostToBucketList(postId, token);
      if (res is Success) {
        var updatedUser = res.response as User;
        UserPreferences().saveUser(updatedUser);
        _bucketList.add(postId);
      } else if (res is Failure) {
        print('Response is: ${res.errorResponse}');
      }
    } else {
      errorMessage = 'User token expired or invalid';
    }

    setState(ViewState.Idle);
  }
}
