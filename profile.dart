import 'package:flutter/material.dart';
import 'dart:ui' show ImageFilter;
import "package:firebase_database/firebase_database.dart";
import 'package:firebase_auth/firebase_auth.dart';

import "Auth.dart";

var _user;
var _phone;
var _dOB;
var _gen;
var _email;
var arr;

class subpage extends StatefulWidget{
  @override

  subpage(String str/*,String mail,String phone,String dob,String gen*/){
    arr = str.split('///--///');
    print(arr[4]);
    /*_user=arr[0];
    _email=arr[1];
    _phone=arr[2];
    _dOB=arr[3];
    _gen=arr[4];
     */
  }

  State<StatefulWidget> createState() {
    return _Subpage();
  }
}

class _Subpage extends State<subpage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState> ();
  bool _autoValidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15.0),
          child: Column(
              children: <Widget> [
                Padding(
                  padding: const EdgeInsets.only(top:20.0,left:3.0,bottom:8.0),
                  child: Row(children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back,color: Colors.black,),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      "  Profile",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),

                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:80,bottom: 40.0),
                  child: Padding(
                        padding: EdgeInsets.only(left:MediaQuery.of(context).size.width *.05),
                        child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.width *.05, bottom: 1.0),
                                child: Text(
                                  arr[0],
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:0.0,bottom:5.0),
                                child: Text(
                                  arr[1],
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black45
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width *.82,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom:10.0),
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
                            icon: Icon(Icons.insert_invitation, color: Colors.white,),
                            onPressed: (){

                            },
                          ),
                          Text(
                            arr[3].toUpperCase(),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width *.82,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom:10.0),
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
                            icon: Icon(Icons.phone, color: Colors.white,),
                            onPressed: (){

                            },
                          ),
                          Text(
                            arr[2].toUpperCase(),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width *.82,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom:10.0),
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
                            icon: Icon(Icons.wc, color: Colors.white,),
                            onPressed: (){

                            },
                          ),
                          Text(
                            arr[4].toUpperCase(),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                            ),
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
                      onPressed: () {
                        _edit(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          " Edit",
                          style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                      color: Colors.black,
                    ),
                  ),
                ),

              ]
          ),


        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _edit(context){

    showDialog(

        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20.0)), //this right here
              child: SingleChildScrollView(
                child: Container(
                  //height: 550,
                  padding: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Edit info",
                              style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            width: 320,
                            child: TextFormField(
                              maxLength: 15,
                              decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black,),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                    ),
                                  ),

                                  labelText: 'username',
                                  labelStyle: TextStyle(color: Colors.black45)
                              ),
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'Required Field';
                                }
                                return null;
                              },
                              onSaved: (String value){
                                Username = value;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            width: 320,
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black,),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                    ),
                                  ),

                                  labelText: 'DD / MM / YYYY',
                                  labelStyle: TextStyle(color: Colors.black45)
                              ),
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'Required Field';
                                }
                                else if(!RegExp(r'^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$').hasMatch(value)){
                                  return 'Invalid format';
                                }
                                return null;
                              },
                              onSaved: (String value){
                                DOB = value;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            width: 320,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black,),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                    ),
                                  ),
                                  labelText: 'phone number',
                                  labelStyle: TextStyle(color: Colors.black45)
                              ),
                              validator: (String value){
                                if(!RegExp(r'^[0-9]{10}$').hasMatch(value)){
                                  return 'Invalid number';
                                }
                                else if(value.isEmpty){
                                  return 'Required Field';
                                }
                                return null;
                              },
                              onSaved: (String value){
                                PhoneNumber = value;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            width: 320,
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  focusedBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black,),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                    ),
                                  ),
                                  labelText: 'gender',
                                  labelStyle: TextStyle(color: Colors.black45)
                              ),
                              validator: (String value){
                                if(value.isEmpty){
                                  return 'Required Field';
                                }
                                return null;
                              },
                              onSaved: (String value){
                                Gender = value;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0,top:4,bottom: 4),
                            child: Text(
                              "Email and password will be allowed to modify in later updates",
                              style: TextStyle(fontSize: 12,color: Colors.black45),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SizedBox(
                              width: 320.0,
                              child: FlatButton(
                                padding: EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                onPressed: () {
                                  if(!_formkey.currentState.validate()){
                                    return;
                                  }
                                  _formkey.currentState.save();
                                  _confirm(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "Save",
                                    style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),
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
                                borderSide: BorderSide(width: 2.0, color: Colors.black),
                                padding: EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
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
                ),
              ),
            ),
          );
        });
  }

  void _confirm(context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(20.0)), //this right here
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Confirm changes?",
                          style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: 320.0,
                          child: FlatButton(
                            padding: EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            onPressed: () {
                              WriteData();

                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Confirm",
                                style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),
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
                            borderSide: BorderSide(width: 3.0, color: Colors.black),
                            padding: EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Cancel",
                                style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
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
            ),
          );
        });
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;


final DBRef=FirebaseDatabase.instance.reference();
String email = '';
String PhoneNumber = '';
String confirmPassword="";
String Gender="";
String Username="";
String DOB="";

void WriteData( ) async{
  final FirebaseUser user1 = await _auth.currentUser();
  final Val = user1.uid;
  print(Val);
  for(var i=100;i<1000;i++){
    DBRef.child("Movies").child(i.toString()).set({
      "Rating":0,
      "NoRatings":0
    });
  }
  DBRef.child(Val).set({
    "User":Username,
    "DOB":DOB,
    "PhoneNumber":PhoneNumber.toString(),
    "Gender":Gender,
  });
}

