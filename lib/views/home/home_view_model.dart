import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/services/api.dart';
import 'package:folder_structure/services/request_status.dart';
import 'package:folder_structure/utils/base_view_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';

class HomeViewModel extends BaseViewModel {
  final Api _api = Api();
  List<Post> _postList = [];
  List<Post> get postList => _postList;

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
}
