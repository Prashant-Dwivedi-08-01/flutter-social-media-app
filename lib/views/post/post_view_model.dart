import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/services/api.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/utils/base_view_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';

class PostViewModel extends BaseViewModel {
  final Api _api = Api();
  Post? _currentPost;
  Post? get currentPost => _currentPost;

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
}
