// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/views/post/post_view_model.dart';
import 'package:provider/src/provider.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostViewModel _postViewModel = context.watch<
        PostViewModel>(); // watch because we need to update UI in future if someone likes it
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(
          2.0,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent, fixedSize: Size(150, 25)),
            onPressed: () {},
            child: Text('Add to Bucketlist',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 18,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ),
      ),
      backgroundColor: Color(0xffededed),
      appBar: AppBar(
        leading: Icon(CupertinoIcons.person_alt),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notification_add),
          )
        ],
        title: Text("Memories"),
        backgroundColor: Colors.deepPurpleAccent, //Color(0xff66005a)
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 400.0,
              height: 400.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1587135941948-670b381f08ce?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80')),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                color: Colors.redAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _postViewModel.currentPost!.title!,
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'By, ${_postViewModel.currentPost!.name!}',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _postViewModel.currentPost!.message!,
                  style: TextStyle(fontSize: 20, fontFamily: 'Gilroy'),
                  // maxLines: 2,
                  // softWrap: false,
                  // overflow: TextOverflow.fade,
                )
              ],
            ),
            Container(
              height: 32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _postViewModel.currentPost!.tags!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xff66005a),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle),
                    child: Text(
                      "#${_postViewModel.currentPost!.tags![index]}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Gilroy'),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.hand_thumbsup_fill),
                        iconSize: 35,
                        color: Colors.deepPurpleAccent),
                    Text(
                      'Total Likes, ${_postViewModel.currentPost!.likes!.length}',
                      style: TextStyle(fontSize: 18, fontFamily: 'Gilroy'),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Comments',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy'),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Your Comment..'),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent),
                  onPressed: () {},
                  child: Text('Comment',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 15,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w700,
                      )),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _postViewModel.currentPost!.comments!.length,
                    itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                child: Icon(
                              CupertinoIcons.person,
                            )),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _postViewModel.currentPost!.comments![index]
                                      .substring(
                                          0,
                                          _postViewModel
                                              .currentPost!.comments![index]
                                              .indexOf(':')),
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(_postViewModel
                                    .currentPost!.comments![index]
                                    .substring(_postViewModel
                                            .currentPost!.comments![index]
                                            .indexOf(':') +
                                        1)),
                                Divider()
                              ],
                            ),
                          ],
                        ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
