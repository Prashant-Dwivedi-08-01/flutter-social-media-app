// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/views/home/home_view.dart';
import 'package:folder_structure/views/home/home_view_model.dart';
import 'package:folder_structure/views/post/post_view_model.dart';
import 'package:provider/src/provider.dart';

class PostView extends StatelessWidget {
  final Post? post;

  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    /*
      When someone like the post, then we will run the concerned function from
      post_view_model and thus there notifyListerns() will be called and this view will be rebuild
    */

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
            CachedNetworkImage(
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
              imageUrl:
                  'https://images.unsplash.com/photo-1587135941948-670b381f08ce?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
              imageBuilder: (context, imageProvider) => Container(
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
                  image:
                      DecorationImage(fit: BoxFit.cover, image: imageProvider),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: Colors.redAccent,
                ),
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
                  post!.title!,
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
                  'By, ${post!.name!}',
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
                  post!.message!,
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
                itemCount: post!.tags!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xff66005a),
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle),
                    child: Text(
                      "#${post!.tags![index]}",
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
                      'Total Likes, ${post!.likes!.length}',
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
                    itemCount: post!.comments!.length,
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
                                  post!.comments![index].substring(
                                      0, post!.comments![index].indexOf(':')),
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(post!.comments![index].substring(
                                    post!.comments![index].indexOf(':') + 1)),
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
