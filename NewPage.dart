import "package:flutter/material.dart";
class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: MyStatefulWidget(),
      //Center(
       // child: Text("Welcome to TechWiz music app ",
       // style:TextStyle(
        //  fontSize: 20.0,
        //  fontWeight: FontWeight.bold,




      //backgroundColor: Colors.brown[100],
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },

        child: AnimatedContainer(


          width: selected ? 200.0 : 100.0,
          height: selected ? 200.0:100.0,
          color: selected ? Colors.red : Colors.blue,
          alignment:
          selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: Text("MyMusic App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          ),

        ),
    );
  }
}
