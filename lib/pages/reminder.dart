import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/whattopay.dart';
import 'image_banner.dart';
import 'package:flutter/widgets.dart';
import "socicon_icons.dart";

class Reminderpage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: setPage(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WhatToPay()));
        },
      child: Icon(Icons.add),
      backgroundColor: Colors.black,
      ),
    );
  }

   @override
  Widget setPage(BuildContext context) {
    return Stack(
          children: <Widget>[
            Container(
              child: ImageBanner('assets/reminder.jpg')
            ),
              Card(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.only(left: 20, right: 18.0, top: 20.0, bottom: 0.0),
                  children: <Widget>[
                    Column(

                      children: <Widget>[

                         ListTile(
                          leading: Icon(Icons.border_color),
                          title: Text("Things to remember"),
                          subtitle: Text("Bills and Expenses"),
                          trailing: Icon(Icons.more_vert),
                        ),
                        
                        Text('DO NOT FORGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Text("Element 1"),
                        Text("Element 2"),
                             Text('DO NOT FORGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Text("Element 1"),
                        Text("Element 2"),
                             Text('DO NOT FORGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Text("Element 1"),
                          Text('DO NOT FORGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Text("Element 1"),
                        Text("Element 2"),
                             Text('DO NOT FORGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Text("Element 1"),
                        Text("Element 2"),
                             Text('DO NOT FORGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Text("Element 1"),
                          Text('DO NOT FORGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Text("Element 1"),
                        Text("Element 2"),
                             Text('DO NOT FORGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Text("Element 1"),
                        Text("Element 2"),
                             Text('DO NOT FORGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Text("Element 1"),
                        Text("Element 2")
                      ],
                    ),
                  ],
                )
              ),
        ]
    );
  }
}