// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        // color: Colors.greenAccent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Memories App',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.celebration,
                    color: Colors.redAccent,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Two people sitting and thinking of documenting there travel memories, this is how the Memories app happened. This beautiful software was created by two senior developers, Prashant and Shreyas, who wanted to show there travel memories to others. Starting with the small website, today Memories is great application where one can store there travel memories and many other memorable occasions of there life, forever!',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Gilroy',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Contact Us',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () {
                      setState(() {
                        _makePhoneCall('tel:9082765110');
                      });
                    },
                  ),
                  Text("  |"),
                  Text(
                    '    9082765110',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.mail),
                    onPressed: () {
                      setState(() {
                        _makePhoneCall('mailto:prashantdwivedi194@gmail.com');
                      });
                    },
                  ),
                  Text("  |"),
                  Text(
                    '    prashantdwivedi194@gmail.com',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Copyright "),
                  Icon(Icons.copyright),
                  Text(" 2021"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Created by Prashant with  "),
                  Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                    size: 15,
                  )
                ],
              )
            ],
          ),
        ));
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
