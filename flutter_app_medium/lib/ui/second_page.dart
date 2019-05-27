import 'package:flutter/material.dart';

import '../counter.dart';

class SecondPage extends StatefulWidget {

  SecondPage({Key key, this.counter}) : super(key: key);
  final int counter;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                '1. Now Increment Conter ',
                overflow: TextOverflow.fade,
              ),

              Text(
                '2. Back to First page',
                overflow: TextOverflow.fade,
              ),

              Text(
                '3. The notification badge need to update.',
                overflow: TextOverflow.fade,
              ),
              Text(
                '4. The value will be at the first page ${Counter.myCounter}',
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
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