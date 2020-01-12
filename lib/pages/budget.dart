import 'package:flutter/material.dart';
import 'package:project/database/database_actions.dart';
import 'package:project/pages/LandingPage.dart';
import 'package:project/pages/addmyexpenses.dart';
import 'image_banner.dart';

// class Budgetpage extends StatelessWidget{


class Budgetpage extends StatefulWidget {

  @override
  _BudgetPageState createState() => _BudgetPageState();

}
class _BudgetPageState extends State<Budgetpage> {
  
  Widget page;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: setPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMyExpenses()));
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
              child: ImageBanner('assets/CoinPHoto.jpg')
            ),
              Card(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
                color: Colors.white,
                child: FutureBuilder(
                          future: DatabaseActions.getMyBudget(),
                          builder: (context, snapshot) {
                            final _myBudget = snapshot.data;
                            print(_myBudget);
                            if (snapshot.connectionState == ConnectionState.done) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Icon(Icons.attach_money),
                                    title: Text(_myBudget[index]['food']),
                                    subtitle: Text(_myBudget[index]['foodprice']),
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
                                              await DatabaseActions.deleteBudget(_myBudget[index]['id']);
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
                                }, itemCount: _myBudget.length,
                              );
                            } else {
                               return Container();
                            }
                          }
                        ),
              ),
        ]
    );
  }

}
  
//   Widget page;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: setPage(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpenses()));
//         },
//       child: Icon(Icons.add),
//       backgroundColor: Colors.black,
//       ),
//     );
//   }

//    @override
//   Widget setPage(BuildContext context) {
//      BuildContext origContext = context;
//     return Stack(
//           children: <Widget>[
//             Container(
//               child: ImageBanner('assets/CoinPHoto.jpg')
//             ),
//               Card(
//                 margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
//                 color: Colors.white,
//                 child: FutureBuilder(
//                           future: DatabaseActions.getMyBudget(),
//                           builder: (context, snapshot) {
//                             final _myBudget = snapshot.data;
//                             print(_myBudget);
//                             if (snapshot.connectionState == ConnectionState.done) {
//                               return ListView.builder(
//                                 itemBuilder: (context, index) {
//                                   return ListTile(
//                                     leading: Icon(Icons.attach_money),
//                                     title: Text(_myBudget[index]['food']),
//                                     subtitle: Text(_myBudget[index]['foodprice']),
//                                     trailing: Icon(Icons.delete_forever),
//                                     onLongPress: () {
//                                      return showDialog(context: context,
//                                      barrierDismissible: false,
//                                      builder: (BuildContext context) {
//                                       return AlertDialog(
//                                       title: Text("Delete"),
//                                       content: Text("Are you sure?"),
//                                         actions: [
//                                           FlatButton(child:  Text("Yes"), 
//                                             onPressed: () async {
//                                               await DatabaseActions.deleteBudget(_myBudget[index]['id']);
//                                               Future.delayed(Duration(seconds: 1), (){
//                                                 Navigator.pop(context);
//                                                   Navigator.push(context, MaterialPageRoute(builder: (context){
//                                                     return Budgetpage();
//                                                   }));
//                                                 }
//                                               );
//                                             }
//                                           ),
//                                           FlatButton(child: Text("No"),
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                             },
//                                           )
//                                         ],
//                                      );
//                                      });
//                                     }
//                                    );
//                                 }, itemCount: _myBudget.length,
//                               );
//                             } else {
//                                return Container();
//                             }
//                           }
//                         ),
//               ),
//         ]
//     );
//   }

// }