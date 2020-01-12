import 'package:flutter/material.dart';
import 'package:project/database/database_actions.dart';
import 'addmyaccount.dart';
import 'image_banner.dart';
import "socicon_icons.dart";


class HomePage extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
                          future: DatabaseActions.getMyAccount(),
                          builder: (context, snapshot) {
                            final _myAccounts = snapshot.data;
                            print(_myAccounts);
                            if (snapshot.connectionState == ConnectionState.done) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(_myAccounts[index]['item']),
                                    subtitle: Text(_myAccounts[index]['price']),
                                    trailing: Icon(Icons.more_vert),
                                  );
                                }, itemCount: _myAccounts.length,
                              );
                            }
                          }
                        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddList()));
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

                        Text('MY ACCOUNT', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                       
                        
                        
                      ],
                    ),

                  ],
                )
              ),
        ],
    );
  }
}