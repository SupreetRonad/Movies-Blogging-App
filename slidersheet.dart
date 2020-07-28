import 'genre.dart';
import 'infor.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'upcoming.dart';
import 'trending.dart';
import 'new.dart';
import 'package:firebase_auth/firebase_auth.dart';

import "Auth.dart";
import 'package:flutter/material.dart';
import "profile.dart";
import "package:firebase_database/firebase_database.dart";
import 'dart:ui' show ImageFilter;
final DBRef=FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;
var user;
var email;
var phone;
var dob;
var gen;


class Sliderpage extends StatefulWidget {



  @override
  _SliderpageState createState() => _SliderpageState();

}

class _SliderpageState extends State<Sliderpage> {

  final AuthService _auth = AuthService();

  int _slidervalue;
  int count = 1;
  int _page=1;
  final _pageoption=[Upcoming(),New(),Trending()];


  void details(index) {}
  var col=Colors.white;
  @override
  Widget build(BuildContext context) {
    final title = 'Moviez';


//App bar
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title,),
          elevation: 0.0,
          brightness: Brightness.light,
          centerTitle: true,
          backgroundColor: Colors.black,

          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                _menu(context);
              },
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          //decoration: BoxDecoration(

          //image: DecorationImage(
          //image: AssetImage('assets/redbg.jpg'),
          // fit: BoxFit.fill,
          //),
          //),
          child: CurvedNavigationBar(
            items: <Widget>[
              Text('UPCOMING',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text('NEW',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
              Text('TRENDING',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            ],
            color: Colors.black12,
            buttonBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            animationDuration: Duration(
                milliseconds: 200
            ),
            animationCurve: Curves.bounceInOut,
            index: 1,
            height: 50.0,
            onTap: (index) {
              setState(() {
                _page=index;

              });
            },
          ),
        ),
        //backgroundColor: Colors.yellow,
        body:_pageoption[_page],

      ),
    );
  }

  void _menu(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            //alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * .05,
                    left: MediaQuery.of(context).size.height * .05,
                    top: 5.0,
                    bottom: 5.0),
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Spacer(),
                      Text(
                        " Menu",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.4)),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Spacer(),
                    ],
                  ),
                  ClipOval(
                    child: Image.asset(
                      'assets/blue2.jpg',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 1.0),
                    child: Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 5.0),
                    child: Text(
                      "example@gmail.com",
                      style: TextStyle(fontSize: 12.0, color: Colors.black45),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .82,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(right: 0.0),
                        onPressed: () {
                          navigateToSubPage(context);
                        },
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.perm_identity,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              "Profile".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .82,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(right: 8.0),
                        onPressed: () {
                          Navigator.of(context).pop();
                          _genreMenu(context);
                        },
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.burst_mode,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Genre".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .82,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(right: 10.0),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20.0)),
                                  //this right here
                                  child: Container(
                                    height: 200,
                                    padding: EdgeInsets.all(10.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Log out?",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: SizedBox(
                                              width: 320.0,
                                              child: FlatButton(
                                                padding: EdgeInsets.all(8.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      15.0),
                                                ),
                                                onPressed: () async{
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                  await _auth.signOut();
                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Log out",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: SizedBox(
                                              width: 320.0,
                                              child: OutlineButton(
                                                borderSide: BorderSide(
                                                    width: 3.0,
                                                    color: Colors.black),
                                                padding: EdgeInsets.all(8.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      15.0),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.exit_to_app,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Log out".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ));
        });
  }

  String dev="///--///";

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => subpage("$user $dev $email $dev $phone $dev $dob $dev $gen")));
  }

  void _genreMenu(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            //alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * .49,
              child: Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * .05,
                    left: MediaQuery.of(context).size.height * .05,
                    top: 5.0,
                    bottom: 5.0),
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Spacer(),
                      Text(
                        " Genre",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.4)),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          _menu(context);
                        },
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Spacer(),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .82,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(right: 10.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Genre('action')),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.whatshot,
                                color: Colors.white,
                              ),
                              onPressed: () {

                              },
                            ),
                            Text(
                              "Action".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .82,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(right: 8.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Genre('comedy')),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.mood,
                                color: Colors.white,
                              ),onPressed: (){

                            },
                            ),

                            Text(
                              "Comedy".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .82,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(right: 10.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Genre('romance')),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              "Romance".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .82,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.black,
                        textColor: Colors.white,
                        padding: EdgeInsets.only(right: 10.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Genre('drama')),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.record_voice_over,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              "Drama".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ));
        });
  }
}

class _Subpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15.0),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 3.0, bottom: 8.0),
            child: Row(children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "  Profile",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                  child: Column(children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        'assets/blue2.jpg',
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.width * .4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * .05,
                          bottom: 1.0),
                      child: Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 5.0),
                      child: Text(
                        "example@gmail.com",
                        style: TextStyle(fontSize: 15.0, color: Colors.black45),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .82,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.black,
                textColor: Colors.white,
                padding: EdgeInsets.only(right: 10.0),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.insert_invitation,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "  DD / MM / YYYY".toUpperCase(),
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .82,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.black,
                textColor: Colors.white,
                padding: EdgeInsets.only(right: 10.0),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "  +911234567890".toUpperCase(),
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .82,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.black,
                textColor: Colors.white,
                padding: EdgeInsets.only(right: 10.0),
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.wc,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "  Male / Female / Other".toUpperCase(),
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 150.0,
              child: OutlineButton(
                borderSide: BorderSide(width: 3.0, color: Colors.black),
                padding: EdgeInsets.all(8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    " Edit",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                color: Colors.black,
              ),
            ),
          ),
        ]),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
void ReadData( ) async{
  final FirebaseUser user1 = await _auth.currentUser();
  final uid = user1.uid;
  DBRef.once().then((DataSnapshot dataSnapShot) {
    user=dataSnapShot.value[uid]['User'];
    email=user1.email;
    phone=dataSnapShot.value[uid]['PhoneNumber'];
    dob=dataSnapShot.value[uid]['DOB'];
    gen=dataSnapShot.value[uid]['Gender'];
  });
}
