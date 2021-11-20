// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/createPost/createpost_view_model.dart';
import 'package:folder_structure/widgets/authentication/submit_button.dart';
import 'package:folder_structure/widgets/createPost/entry_field.dart';
import 'package:folder_structure/widgets/shared/shared_drawer.dart';
import 'package:provider/provider.dart';

class CreatePostView extends StatelessWidget {
  CreatePostView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController selectedFileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SharedDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<CreatePostViewModel>(
          builder: (context, model, child) => Form(
            key: _formKey,
            child: Column(
              children: [
                CreatePostEntryField(
                  controller: titleController,
                  hintText: 'Title',
                ),
                CreatePostEntryField(
                  controller: messageController,
                  hintText: 'Message',
                ),
                CreatePostEntryField(
                  controller: tagsController,
                  hintText: 'Tags',
                ),
                CreatePostEntryField(
                  controller: selectedFileController,
                  hintText: 'Image',
                ),
                model.errorMessage != null
                    ? SizedBox(
                        child: Text(model.errorMessage!),
                        height: 50,
                      )
                    : SizedBox(
                        height: 10,
                      ),
                ElevatedButton(
                    onPressed: () async {
                      // bool nullStatus = false;
                      // if (titleController.text == '' ||
                      //     messageController.text == '' ||
                      //     tagsController.text == '' ||
                      //     selectedFileController.text == '') {
                      //   nullStatus = true;
                      // }
                      if (!_formKey.currentState!.validate()) return;
                      // _formKey.currentState!.save();

                      Map<String, dynamic> post = {
                        "title": titleController.text,
                        "message": messageController.text,
                        "tags": tagsController.text.split(','),
                        "selectedFile": selectedFileController.text
                      };
                      await model.createPost(post, false);

                      if (model.createdPost != null) {
                        Navigator.popAndPushNamed(context, '/post',
                            arguments: model.createdPost);
                      }
                    },
                    child: model.state == ViewState.Idle
                        ? Text('Submit')
                        : CircularProgressIndicator())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
