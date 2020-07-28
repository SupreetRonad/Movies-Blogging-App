import 'package:flutter/material.dart';
import 'slidersheet.dart';
import 'infor.dart';


class Genre extends StatelessWidget {
  var _gen;
  Genre (var val){
    _gen=val;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/redbg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        //buttons
        //SUPREET
        child: SingleChildScrollView(
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
              child: bb(context)

//            ],
//
//          ),
        ),

      ),
    );
  }
  Widget bb(context){
    for(var j in data){
      if(j.Genre==_gen){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Container(
              height: 200,
              width: MediaQuery
                  .of(context)
                  .size
                  .height * .7,
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
                      'assets/blue2.jpg',
                      width: 130.0,
                      height: 180.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          j.Moviename,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text(
                          j.Genre,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Rating : 10.0",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                  )
                ]),
              ),
            ),
            onTap: () {
              showModalBottomSheet(context: context, shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
                  builder:(context)
                  {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(j.Descrption),

                    );
                  });
            },
          ),
        );
      }
    }

  }
}
