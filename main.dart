import 'package:firebase_core/firebase_core.dart';
import "package:firebase_database/firebase_database.dart";
import "package:firebase_database/ui/firebase_animated_list.dart";
import 'package:uk/Home.dart';
import 'package:uk/NewPage.dart';

import 'Wrapper.dart';
import 'Auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'User.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}