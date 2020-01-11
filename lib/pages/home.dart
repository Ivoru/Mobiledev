import 'package:flutter/material.dart';
import 'image_banner.dart';
import "socicon_icons.dart";


class HomePage extends StatelessWidget {
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
              child: ImageBanner('assets/bg.jpg')
            ),
              Card(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.only(left: 20, right: 18.0, top: 20.0, bottom: 0.0),
                  
                  children: <Widget>[
                    Column(
                      children: <Widget>[

                        Text('CURRENT ACCOUNT', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        
                        ListTile(
                          title: Text("Travel"),
                          subtitle: Text("enjoy and have fun"),
                          trailing: Icon(Icons.more_vert),
                        ),
                   
                        ListTile(
                          leading: Icon(Icons.landscape),
                          title: Text("Travel"),
                          subtitle: Text("enjoy and have fun"),
                          trailing: Icon(Icons.more_vert),
                        ),

                      ],
                    ),

                  ],
                )
              ),
        ]
    );
  }
}