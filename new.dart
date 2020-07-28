
import 'package:flutter/material.dart';
import 'infor.dart';


class New extends StatefulWidget {

  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {


  @override
  Widget build(BuildContext context) {

    return Container(
//      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage('assets/redbg.jpg'),
//          fit: BoxFit.fill,
//        ),
//      ),
      //buttons
      //SUPREET
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (var j in data)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.height * .7,
                    decoration: new BoxDecoration(
                        color: Colors.black12,
                        //new Color.fromRGBO(255, 0, 0, 0.0),
                        borderRadius: new BorderRadius.all(
                          const Radius.circular(30.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/${j.id}.jpg',
                            width: 130.0,
                            height: 180.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                j.Moviename,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text(
                                "Genre",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Rating:${j.Slidervalue.toString()}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding:const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                              child: Slider(
                                value: ( j.Slidervalue ?? 0).toDouble(),
                                activeColor: Colors.white,
                                inactiveColor: Colors.blue,
                                min: 0,
                                max: 5,
                                divisions: 5,
                                onChanged: (val) {
                                  setState(() {
                                    j.Slidervalue = val.round();
                                    //print(j.Slidervalue);
                                  });
                                },
                              ),
                            ),
                          ]),
                        )
                      ]),
                    ),
                  ),
                  onTap: (){
                    showModalBottomSheet(context: context, shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                        builder:(context)
                        {
                          return Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text('Cast:${j.Cast} ',style: TextStyle(fontSize: 20.0),),
                                SizedBox(height: 10.0,),
                                Text('Description:${j.Descrption} ',style: TextStyle(fontSize: 20.0),),
                              ],
                            ),

                          );
                        });
                  },
                ),
              )
          ],

        ),
      ),

    );
  }
}
