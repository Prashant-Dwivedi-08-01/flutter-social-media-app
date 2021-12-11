// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/createPost/createpost_view_model.dart';
import 'package:folder_structure/views/post/post_view_model.dart';
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
      backgroundColor: Color(0xffededed),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/create-post.png',
                      width: 300,
                    ),
                    Text(
                      'Make Your Own Memory!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Consumer<CreatePostViewModel>(
                builder: (context, model, child) => Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CreatePostEntryField(
                        controller: titleController,
                        hintText: 'Title',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CreatePostEntryField(
                        controller: messageController,
                        hintText: 'Message',
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CreatePostEntryField(
                        controller: tagsController,
                        hintText: 'Tags',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CreatePostEntryField(
                        controller: selectedFileController,
                        hintText: 'Image',
                      ),
                      SizedBox(
                        height: 3,
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
                            if (!_formKey.currentState!.validate()) return;

                            Map<String, dynamic> post = {
                              "title": titleController.text,
                              "message": messageController.text,
                              "tags": tagsController.text.split(','),
                              "selectedFile": selectedFileController.text
                            };
                            await model.createPost(post);

                            if (model.createdPost != null) {
                              PostViewModel postViewModel =
                                  context.read<PostViewModel>();
                              postViewModel.setThisPost(model.createdPost!);
                              Navigator.popAndPushNamed(context, '/post',
                                  arguments: model.createdPost);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 3, primary: Colors.deepPurpleAccent),
                          child: model.state == ViewState.Idle
                              ? Text(
                                  'Create',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.bold),
                                )
                              : SizedBox(
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
