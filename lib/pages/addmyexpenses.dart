import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/database/database_actions.dart';
import 'package:project/pages/LandingPage.dart';
import 'package:project/pages/budget.dart';
import 'package:project/pages/reminder.dart';

class AddMyExpenses extends StatefulWidget{


  _AddMyExpensesState createState() => _AddMyExpensesState();
}

class _AddMyExpensesState extends State<AddMyExpenses>{

  TextEditingController food = TextEditingController();
  TextEditingController foodprice = TextEditingController();

  TextEditingController accomodation = TextEditingController();
  TextEditingController accomodationprice = TextEditingController();
  
  TextEditingController fare = TextEditingController();
  TextEditingController fareprice = TextEditingController();
  
  TextEditingController personal = TextEditingController();
  TextEditingController personalprice = TextEditingController();


  String id;

  Future<List<Map<dynamic, dynamic>>> items;

  List<Map<dynamic,dynamic>> itemList = new List();

     @override
    void initState(){
   
      
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Expenses'),
      ),
      body: Container(
        color: Colors.white,
        child: Container(
          child: SingleChildScrollView(
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
                icon: Icon(Icons.restaurant),
                labelText: 'Food'
            ),
            controller: food,
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
                labelText: 'Price'
              ),
              controller: foodprice
            ),
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
                icon: Icon(Icons.home),
                labelText: 'Accomodation'
            ),
            controller: accomodation,
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
                labelText: 'Price'
              ),
              controller: accomodationprice,
            ),
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
                icon: Icon(Icons.control_point),
                labelText: 'Fare'
            ),
            controller: fare,
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
                labelText: 'Price'
              ),
              controller: fareprice,
            ),
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
                icon: Icon(Icons.control_point),
                labelText: 'Personal Expenses'
            ),
            controller: personal,
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
                labelText: 'Price'
              ),
              controller: personalprice
            ),

            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  RaisedButton(
                  color: Colors.green,
                  onPressed: () async{
                    await DatabaseActions.insertBudget({
                        'bill': food.text, 
                        'amount': foodprice.text,
                        'dueDate': accomodation.text,
                        'uid': DatabaseActions.getCurrentId()
                        });
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Budgetpage();
                        }));
                  },
                  child: Text(
                    'Add', style: TextStyle(backgroundColor: Colors.green,color: Colors.white
                  ),
                )),
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
        ),
      ),
    );
  }
}
