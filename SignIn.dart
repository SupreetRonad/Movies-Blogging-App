import 'package:flutter/cupertino.dart';

import 'Auth.dart';

import 'loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
    child: SingleChildScrollView(
    child: Form(
    key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text("Moviez",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      SizedBox(height:100.0),
    Row(children: <Widget>[

    Padding(
      padding:EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
      child: Text(
      "  Sign in",
      style: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.black
      ),
      ),
    ),
    Spacer(),

    ]),
SizedBox(height: 20.0),
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

                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black45)
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
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
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
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

                      setState(() =>loading=true, );
                      if(_formKey.currentState.validate()){
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        setState(() =>loading=false, );
                        if(result == null ) {
                          setState(() {
                            loading=false;
                            error = 'Invalid Credential';
                          }
                          );
                        }

                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Sign In",
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
                        "Register",
                        style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),


              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),

            ],
          ),
        ),
      ),
      ),

    );
  }
}

