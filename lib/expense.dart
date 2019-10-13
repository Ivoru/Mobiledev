import 'package:flutter/material.dart';
import 'socicon_icons.dart';

class Expensepage extends StatelessWidget{

  BoxDecoration myBoxDecoration(){
    return BoxDecoration(
      border:Border.all(
      color: Colors.black,
      width:5.0
    ),
    );
  }
   @override
  Widget build(BuildContext context) {
    
      return Container(
        child: new Column(
          children: <Widget>[
            
               new Container(
                  
                          margin: const EdgeInsets.all(10.0),
                      height: 48.0,
                      width:300.0,
                      
                      padding: const EdgeInsets.all(.0),
                      decoration:myBoxDecoration(),
                      
                      child: Text("Expenses",
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.center,
                    
                        )
                        ),
                        new Row(children: [

                    new Container(
                      child:FlatButton.icon(
                      icon:Icon(Socicon.add),
                      label:Text("Weekly"),
                      onPressed: (){


                      },

                    ),
                      

                      

                      ),

                      new Container(
                      child:FlatButton.icon(
                      icon:Icon(Icons.calendar_today),
                      label:Text("Monthly"),
                      
                      onPressed: (){


                      },

                    ),
                      

                      

                      ),

                      new Container(
                      child:FlatButton.icon(
                      icon:Icon(Icons.calendar_view_day),
                      label:Text("Yearly"),
                      onPressed: (){


                      },

                    ),
                      )
                        ]
                        



            ),
          ],
        ),
      );



  }
}