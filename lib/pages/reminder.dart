import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/database/database_actions.dart';
import 'package:project/pages/addreminder.dart';
import 'image_banner.dart';
import 'package:flutter/widgets.dart';

class Reminderpage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();

}

class _ReminderPageState extends State<Reminderpage> {

  
  Widget page;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: setPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddReminder()));
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
              child: ImageBanner('assets/reminder.jpg')
            ),
              Card(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
                color: Colors.white,
                child: FutureBuilder(
                          future: DatabaseActions.getMyReminder(),
                          builder: (context, snapshot) {
                            final _reminder = snapshot.data;
                            print(_reminder);
                            if (snapshot.connectionState == ConnectionState.done) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(Icons.attach_money),
                                    title: Text(_reminder[index]['bill']),
                                    subtitle: Text(_reminder[index]['amount']),
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
                                              await DatabaseActions.deleteReminder(_reminder[index]['id']);
                                              Future.delayed(Duration(seconds: 1), (){
                                                Navigator.pop(context);
                                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                                    return Reminderpage();
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
                                }, itemCount: _reminder.length,
                              );
                            } else {
                               return Container();
                            }
                          }
                        ),
              
              ),
        ],
    );
  }
}
// class Reminderpage extends StatelessWidget{

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: setPage(context),



      
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => WhatToPay()));
//         },
//       child: Icon(Icons.add),
//       backgroundColor: Colors.black,
//       ),
//     );
//   }

//    @override
//   Widget setPage(BuildContext context) {
//     return Stack(
//           children: <Widget>[
//             Container(
//               child: ImageBanner('assets/reminder.jpg')
//             ),
//               Card(
//                 margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
//                 color: Colors.white,
//                 child: ListView(
//                   padding: EdgeInsets.only(left: 20, right: 18.0, top: 20.0, bottom: 0.0),
//                   children: <Widget>[
//                     Column(

//                       children: <Widget>[

//                          ListTile(
//                           leading: Icon(Icons.border_color),
//                           title: Text("Things to remember"),
//                           subtitle: Text("Bills and Expenses"),
//                           trailing: Icon(Icons.more_vert),
//                         )
//                       ],
//                     ),
//                   ],
//                 )
//               ),
//         ]
//     );
//   }
// }