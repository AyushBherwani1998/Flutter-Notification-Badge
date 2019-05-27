import 'package:flutter/material.dart';
import 'second_page.dart';
import 'package:flutter_app_medium/counter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Badge"),
        actions: <Widget>[
          // Using Stack to show Notification Badge
          new Stack(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.notifications), onPressed: () {
                setState(() {
                  Counter.myCounter = 0;
                });
              }),
              Counter.myCounter != 0 ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '${Counter.myCounter}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) : new Container()
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SecondPage())),
            child: Text("Goto Next Page"),
          ),
          Center(
            child: Text(
              'The value is ${Counter.myCounter}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print("Increment Counter");
        setState(() {
          Counter.myCounter++;
        });
      }, child: Icon(Icons.add),),
    );
  }
}