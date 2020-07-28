import 'package:firebase_auth/firebase_auth.dart';
import 'package:uk/Home.dart';
import 'package:uk/User.dart';

import 'Auth.dart';
import "UserDetails.dart";
import 'package:flutter/material.dart';
import "package:firebase_database/firebase_database.dart";
import "package:firebase_database/ui/firebase_animated_list.dart";
import "package:firebase_core/firebase_core.dart";

import 'package:cloud_firestore/cloud_firestore.dart';
import "Loading.dart";
import 'package:uk/Database.dart';
import 'package:uk/Register.dart';

import 'User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "UserDetails.dart";

import 'package:cloud_firestore/cloud_firestore.dart';

final DBRef=FirebaseDatabase.instance.reference();
bool loading=false;

String value='';
String email = '';
String password = '';
String confirmPassword="";
String temp="";
String Username="";
String DOB="";
int i;
String temp1;
String Gender="";
String temp2="";
String temp3="";
String temp4="";
String PhoneNumber;
String gnickname;
var user;
var email1;
var phone;
var dob;
var gen;
var res;




class Register extends StatefulWidget {
  String PassValue=temp;

  final Function toggleView;
  Register({ this.toggleView });

  @override

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state



  @override
  Widget build(BuildContext context) {
    return loading ?Loading() :Scaffold(
      backgroundColor: Colors.brown[100],

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[

                   Row(children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(top:10.0,bottom:10.0),
                      child: Text(
                        "  Register",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Spacer(),

                  ]),

                TextFormField(
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

                      labelText: 'email',
                      labelStyle: TextStyle(color: Colors.black45)
                  ),
                  validator: (val) { val.isEmpty ? 'Enter an email' : null ;
                    if(!RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)').hasMatch(val)){
                      return 'invalid email';
                    }
                  },
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
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

                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black45)
                  ),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                      SizedBox(height: 10.0),
                TextFormField(
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

                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.black45)
                    ),
                    obscureText: true,
                    validator: (val) =>val!=password ? 'Password not confirmed ${loading=false}' :null,

                    onChanged: (val) {
                      setState(() => confirmPassword = val);
                    }



                ),
                SizedBox(height: 10.0),
                TextFormField(
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

                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.black45)
                  ),
                  validator: (val) => val.isEmpty ? 'Enter the username' : null ,
                  onChanged: (val) {
                    setState(() {

                      Username = val;
                      temp=Username;

                    });
                  },


                ),
                SizedBox(height: 10.0),
                TextFormField(
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

                        labelText: 'DOB:dd/mm/yyyy',
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
                    onChanged: (val) {
                      setState(() {
                        DOB=val;
                        temp4=DOB;
                      });
                    }




                ),
                SizedBox(height: 10),
                TextFormField(
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

                        labelText: 'Phone Number',
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
                    onChanged: (val) {
                      setState(() {
                        PhoneNumber=val ;
                        temp1=PhoneNumber;
                      });
                    }




                ),
                SizedBox(height: 10),
                TextFormField(
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

                        labelText: 'Gender',
                        labelStyle: TextStyle(color: Colors.black45)
                    ),
                    validator:(val)=>val.isEmpty ? "Enter the Gender" : null,
                    onChanged: (val) {
                      setState(() {
                        Gender=val;
                        temp2=Gender;
                      });
                    }

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
                        onPressed: () async {
                          AuthService(Username: temp,DOB:temp4,PhoneNumber: temp1,Gender: temp2);
                          setState(() =>loading=true, );
                          if(_formKey.currentState.validate()){
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                            setState(() =>loading=false, );
                            if(result == null ) {
                              setState(() {
                                loading=false;
                                error = '';
                              }
                              );
                            }
                          }
                          else{
                            setState(() {
                              loading=false;
                              error = 'Invalid Credential';
                            });
                          }
                        },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Register",
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
                        widget.toggleView();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Sign in",
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
  }
}


final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
  final String Username;
  final String DOB;
  final String Gender;
  final String PhoneNumber;


  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;

  }


  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;


      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;


      WriteData(user.uid.toString());

      /*getData(String Val) async {

        return await FirebaseDatabase.instance.reference().child(Val).equalTo(user.uid);
      }*/







      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());

      return null;
    }
  }

  AuthService({this.Username,this.DOB,this.PhoneNumber,this.Gender});

}
void WriteData(String Val ){
  print(Val);
  DBRef.child(Val).set({
    "User":Username,
    "DOB":DOB,
    "PhoneNumber":PhoneNumber.toString(),
    "Gender":Gender,
  });
}
var result;
void ReadData( ) async{
  final FirebaseUser user1 = await _auth.currentUser();
  final uid = user1.uid;
  DBRef.once().then((DataSnapshot dataSnapShot) {
    user=dataSnapShot.value[uid]['User'];
    email1=dataSnapShot.value[uid]['Email'];
    phone=dataSnapShot.value[uid]['PhoneNumber'];
    dob=dataSnapShot.value[uid]['DOB'];
    gen=dataSnapShot.value[uid]['Gender'];
    result= "$user ";
  });
}


 class info extends StatefulWidget {
   @override
   _infoState createState() => _infoState();
 }

 class _infoState extends State<info> {
   final AuthService _auth = AuthService();
   final _formKey = GlobalKey<FormState>();
   String error = '';
   @override

   Widget build(BuildContext context) {
     return Container(
     child:Form(


       key: _formKey,
       child:Column(
         children: <Widget>[
           TextFormField(
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

                 labelText: 'Username',
                 labelStyle: TextStyle(color: Colors.black45)
             ),
             validator: (val) => val.isEmpty ? 'Enter the username' : null ,
             onChanged: (val) {
               setState(() {

                 Username = val;
                 temp=Username;

               });
             },


           ),
           SizedBox(height: 10.0),
           TextFormField(
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

                   labelText: 'DOB:dd/mm/yyyy',
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
               onChanged: (val) {
                 setState(() {
                   DOB=val;
                   temp4=DOB;
                 });
               }




           ),
           SizedBox(height: 10),
           TextFormField(
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

                   labelText: 'Phone Number',
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
               onChanged: (val) {
                 setState(() {
                   PhoneNumber=val ;
                   temp1=PhoneNumber;
                 });
               }




           ),
           SizedBox(height: 10),
           TextFormField(
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

                   labelText: 'Gender',
                   labelStyle: TextStyle(color: Colors.black45)
               ),
               validator:(val)=>val.isEmpty ? "Enter the Gender" : null,
               onChanged: (val) {
                 setState(() {
                   Gender=val;
                   temp2=Gender;
                 });
               }

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
                 onPressed: () async {
                   AuthService(Username: temp,DOB:temp4,PhoneNumber: temp1,Gender: temp2);
                   setState(() =>loading=true, );
                   if(_formKey.currentState.validate()){
                     dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                     setState(() =>loading=false, );
                     if(result == null ) {
                       setState(() {
                         loading=false;
                         error = '';
                       }
                       );
                     }
                   }
                   else{
                     setState(() {
                       loading=false;
                       error = 'Invalid Credential';
                     });
                   }
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Text(
                     "Register",
                     style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),
                   ),
                 ),
                 color: Colors.black,
               ),
             ),
           ),
         ],
       ),
     ),
     );
   }
 }
