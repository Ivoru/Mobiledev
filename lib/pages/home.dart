import 'package:flutter/material.dart';
import 'package:project/database/database_actions.dart';
import 'package:project/pages/LandingPage.dart';
import 'addmyaccount.dart';
import 'image_banner.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  
  Widget page;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: setPage(),
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
  Widget setPage() {
    BuildContext origContext = context;
    return Stack(
          children: <Widget>[
            Container(
              child: ImageBanner('assets/bg.jpg')
            ),
              Card(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
                color: Colors.white,
                child: FutureBuilder(
                          future: DatabaseActions.getMyAccount(),
                          builder: (context, snapshot) {
                            final _myAccounts = snapshot.data;
                            print(_myAccounts);
                            if (snapshot.connectionState == ConnectionState.done) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(Icons.attach_money),
                                    title: Text(_myAccounts[index]['item']),
                                    subtitle: Text(_myAccounts[index]['price']),
                                    trailing: Icon(Icons.delete_forever),
                                    onLongPress: () {
                                     return showDialog(context: context,
                                     barrierDismissible: false,
                                     builder: (BuildContext context) {
                                      return AlertDialog(
                                      title: Text("Delete"),
                                      content: Text("Are you sure?"),
                                        actions: [
                                          FlatButton(child:  Text("Yes"), 
                                            onPressed: () async {
                                              await DatabaseActions.deleteList(_myAccounts[index]['id']);
                                              Future.delayed(Duration(seconds: 1), (){
                                                Navigator.pop(context);
                                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                                    return LandingPage();
                                                  }));
                                                }
                                              );
                                            }
                                          ),
                                          FlatButton(child: Text("No"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                     );
                                     });
                                    }
                                   );
                                }, itemCount: _myAccounts.length,
                              );
                            } else {
                               return Container();
                            }
                          }
                        ),
                // ListView(
                //   padding: EdgeInsets.only(left: 20, right: 18.0, top: 20.0, bottom: 0.0),
                  
                //   children: <Widget>[
                //     Column(
                //       children: <Widget>[

                //         Text('MY ACCOUNT', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                       
                        
                        
                //       ],
                //     ),

                //   ],
                // )
              ),
        ],
    );
  }
}

// FutureBuilder(
//                           future: DatabaseActions.getMyAccount(),
//                           builder: (context, snapshot) {
//                             final _myAccounts = snapshot.data;
//                             print(_myAccounts);
//                             if (snapshot.connectionState == ConnectionState.done) {
//                               return ListView.builder(
//                                 itemBuilder: (context, index) {
//                                   return ListTile(
//                                     leading: Icon(Icons.border_color),
//                                     title: Text(_myAccounts[index]['item']),
//                                     subtitle: Text(_myAccounts[index]['price']),
//                                     trailing: Icon(Icons.more_vert),
                                    
//                                   );
//                                 }, itemCount: _myAccounts.length,
//                               );
//                             }
//                             if (snapshot.hasError){
//                               return Text("SomethingWentWrong");
//                             }
//                           }
//                         ),