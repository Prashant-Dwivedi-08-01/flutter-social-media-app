// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/models/post_model.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/home/home_view_model.dart';
import 'package:folder_structure/views/post/post_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeViewModel _homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: Color(0xffededed),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {},
        child: Icon(
          CupertinoIcons.add_circled,
        ),
      ),
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
      body: Consumer<HomeViewModel>(
          builder: (context, homeModel, child) => Center(
                child: homeModel.state == ViewState.Busy
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hot Destinations',
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 250,
                              child: (ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  Post post = homeModel.postList[index];
                                  return Consumer<PostViewModel>(
                                    builder: (context, model, child) => Card(
                                      shadowColor: Colors.white,
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            progressIndicatorBuilder:
                                                (context, url, progress) =>
                                                    Center(
                                              child: CircularProgressIndicator(
                                                value: progress.progress,
                                              ),
                                            ),
                                            imageUrl:
                                                'https://images.unsplash.com/photo-1587135941948-670b381f08ce?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: 320.0,
                                              height: 180.0,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: imageProvider),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16.0)),
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                print(post.id);
                                                Navigator.pushNamed(
                                                    context, '/post',
                                                    arguments: post);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary:
                                                      Colors.deepPurpleAccent),
                                              child: Text(
                                                post.title!,
                                                style: TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 20),
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: homeModel.postList.length,
                              )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'More',
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            Expanded(
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: homeModel.postList.length,
                                  itemBuilder: (context, index) {
                                    Post post = homeModel.postList[index];
                                    return Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Colors.deepPurpleAccent.shade100),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CachedNetworkImage(
                                            progressIndicatorBuilder:
                                                (context, url, progress) =>
                                                    Center(
                                              child: CircularProgressIndicator(
                                                value: progress.progress,
                                              ),
                                            ),
                                            imageUrl:
                                                'https://images.unsplash.com/photo-1610878180933-123728745d22?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1074&q=80',
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              width: 150.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: imageProvider),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16.0)),
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  post.title!,
                                                  style: TextStyle(
                                                      fontFamily: 'Gilroy',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                  post.message!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontFamily: 'Gilroy',
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
              )),
    );
  }
}
