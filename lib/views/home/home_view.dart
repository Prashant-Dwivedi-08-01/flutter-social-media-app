// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folder_structure/services/user_prefrences.dart';
import 'package:folder_structure/utils/view_state_enum.dart';
import 'package:folder_structure/views/home/home_view_model.dart';
import 'package:folder_structure/widgets/home/action_buttons.dart';
import 'package:folder_structure/widgets/home/hot_destinations.dart';
import 'package:folder_structure/widgets/home/more_destinations.dart';
import 'package:folder_structure/widgets/shared/shared_drawer.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // HomeViewModel _homeViewModel = context.watch<HomeViewModel>();

    return Scaffold(
      drawer: SharedDrawer(),
      // backgroundColor: Color(0xffededed),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff692975),
        onPressed: () {
          Navigator.pushNamed(context, '/createPost');
        },
        child: Icon(
          CupertinoIcons.add_circled,
          size: 40,
        ),
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notification_add),
          )
        ],
        title: Text("Memories"),
        backgroundColor: Colors.deepPurpleAccent, //Color(0xff66005a)
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Consumer<HomeViewModel>(
              builder: (context, homeModel, child) => Center(
                    child: homeModel.state == ViewState.Busy
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hot Destinations',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  HotDestinations(
                                    homeModel: homeModel,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ActionButtons(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'More',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  MoreDestinations(
                                    homeModel: homeModel,
                                  )
                                ],
                              ),
                            ),
                          ),
                  )),
          Container(
            color: Colors.indigoAccent,
            child: Center(
                child: Text(
              'Profile Page',
              style: TextStyle(fontSize: 25),
            )),
          ),
          Container(
            color: Colors.greenAccent,
            child: Center(
                child: Text(
              'More Page',
              style: TextStyle(fontSize: 25),
            )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
              activeColor: Colors.deepPurpleAccent),
          BottomNavyBarItem(
              title: Text('Profile'),
              icon: Icon(Icons.person),
              activeColor: Colors.deepPurpleAccent),
          BottomNavyBarItem(
              title: Text('More'),
              icon: Icon(Icons.more),
              activeColor: Colors.deepPurpleAccent),
        ],
      ),
    );
  }
}
