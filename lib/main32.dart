import 'package:flutter/material.dart';


void main() => runApp(Start());

class Start extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bharat'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[350],
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(100.0),

            child: Column(
              children: <Widget>[
                ElevatedButton( onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Schedule()),);
                }, 
                child: Text(
                  'Schedule',
                  style: TextStyle(
                     fontSize: 30.0,
                     fontFamily: 'SourceSansPro',
                  )),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(700,80),
                  primary: Colors.red[350],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  onPrimary: Colors.grey[400]
                ),
                )
            ],
            ), 
          ),
        )
        ),
      // ignore: dead_code
    );
  }
}
class Schedule extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Schedule'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[350],
        ),
        body: Center(
          
          child: Text(
            'hello ninjas!',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.grey[600],
              fontFamily: 'SourceSansPro',
               
            ),
          ),
        ),
      );
  }
}
