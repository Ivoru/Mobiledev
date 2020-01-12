import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/database/database_actions.dart';
import 'package:project/pages/home.dart';
import 'LandingPage.dart';
import 'image_banner.dart';
import 'package:flutter/widgets.dart';

class AddList extends StatefulWidget{
  // AddList({Key key, this.user, this.brew,}) : super(key: key);
  // // final FirebaseUser user;
  // // final Prod brew;

  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList>{

  TextEditingController item = TextEditingController();

  TextEditingController price = TextEditingController();

  TextEditingController quantity = TextEditingController();


  String id;

  // final db = Firestore.instance;

  Future<List<Map<dynamic, dynamic>>> items;

  List<Map<dynamic,dynamic>> itemList = new List();

     @override
    void initState(){
      // super.initState();
      // items = getDocuments();
      
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('What to buy'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0,),
            TextFormField(
              cursorColor: Colors.black,
              cursorRadius: Radius.circular(5.0),
              cursorWidth: 5.0,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide()
                ),
                icon: Icon(Icons.queue),
                labelText: 'Item name'
            ),
            controller: item,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              cursorColor: Colors.black,
              cursorRadius: Radius.circular(5.0),
              cursorWidth: 5.0,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide()
                ),
                icon: Icon(Icons.attach_money),
                labelText: 'Pricez'
              ),
              controller: price
            ),
            SizedBox(height: 10.0,),
            SizedBox(height: 10.0,),
            TextFormField(
              cursorColor: Colors.black,
              cursorRadius: Radius.circular(5.0),
              cursorWidth: 5.0,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide()
                ),
                icon: Icon(Icons.plus_one),
                labelText: 'Quantity'
              ),
              controller: quantity,
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  onPressed: () async{
                    await DatabaseActions.insertMyAccount({
                        'item': item.text, 
                        'price': price.text,
                        'quantity': quantity.text,
                        'uid': DatabaseActions.getCurrentId()
                        });
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return LandingPage();
                        }));
                  },
                    child: Text(
                    'Add', style: TextStyle(backgroundColor: Colors.green,color: Colors.white),),
                  ),
                SizedBox(width: 50.0,),
                RaisedButton(
                  color: Colors.red,
                  child: Text(
                    'Cancel', style: TextStyle(backgroundColor: Colors.red, color: Colors.white),),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//   Future<List<Map<dynamic,dynamic>>> getDocuments() async {
//     try {
//       QuerySnapshot querySnapshot = await Firestore.instance.collection(widget.user.uid).getDocuments();
//       var templist = querySnapshot.documents;
//       List<Map<dynamic, dynamic>> list = new List();

//       list = templist.map(
//         (DocumentSnapshot docSnapshot) {
//           Map<String, dynamic> doc = docSnapshot.data;
//           doc['uid'] = docSnapshot.documentID;
//           return doc;
//         }
//       ).toList();

//       for ( var i = 0 ; i != list.length ; i++) {
//         itemList.add(list[i]);
//       }

//       print(list);
//       print(itemList);
//       return list;

//     } catch(e) {
//       print(e);
//       return null;
//     }
//   }

//   Center userPage(DocumentSnapshot snapshot) {
//     return Center(child: Column(
//       children: <Widget>[
//         Text(snapshot.data['name']),
//         Text(snapshot.data['age']),
//         Text(snapshot.data['date']),
//         Text(snapshot.data['username']),
//       ],
//     ));
//   }

//   Future addItem() async{
//     try{
//       Firestore.instance
//         .collection(widget.user.uid)
//         .add({
//           "name" : name.text.toUpperCase(),
//           "data" : data.text.toUpperCase(),
//           "userID" : widget.user.toString(),
//           "group" : group.text.toUpperCase(),
//           "members" : member.text.toUpperCase()
//         })
//       .then((result) => {
//         Firestore.instance
//         .collection(widget.user.uid)
//         .document(result.documentID)
//         .get()
//         .then((DocumentSnapshot snaps) async{
//           print("added");
//           Navigator.pop(context);
//           Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: widget.user, brew: widget.brew)));
//           setState(() {
//             super.initState();
//           });
//           name.clear();
//           data.clear();
//         })
//           .catchError((err){
//             print(err);
//           })
//       });
//     }catch(e){
//       print(e);
//     }
//   }
// }