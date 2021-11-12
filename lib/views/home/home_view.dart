// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/home/home_view_model.dart';
import 'package:folder_structure/widgets/home/hot_destinations.dart';
import 'package:folder_structure/widgets/home/more_destinations.dart';
import 'package:provider/provider.dart';

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
                            HotDestinations(
                              homeModel: homeModel,
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
                            MoreDestinations(
                              homeModel: homeModel,
                            )
                          ],
                        ),
                      ),
              )),
    );
  }
}
