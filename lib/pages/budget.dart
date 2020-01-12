import 'package:flutter/material.dart';
import 'package:project/pages/addbudget.dart';
import 'socicon_icons.dart';
import 'image_banner.dart';

class Budgetpage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: setPage(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpenses())); 
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
              child: ImageBanner('assets/CoinPHoto.jpg')
            ),
              Card(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.only(left: 20, right: 18.0, top: 20.0, bottom: 0.0),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('MY BUDGET', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                        
                         ListTile(
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