import 'package:flutter/material.dart';
import 'image_banner.dart';

class Settingspage extends StatelessWidget{

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: setPage(context),
    );
  }

   @override
  Widget setPage(BuildContext context) {
    return Stack(
          children: <Widget>[
            Container(
              child: ImageBanner('assets/setting.jfif')
            ),
              Card(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.only(left: 20, right: 18.0, top: 20.0, bottom: 0.0),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('SETTINGS', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('\nChange Background', style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('\nChange Currency', style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('\nChange Alert Sound', style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('\nAbout', style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                  ],
                )
              ),
        ]
    );
  }
}
