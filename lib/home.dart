import 'package:flutter/material.dart';
import "socicon_icons.dart";


class HomePage extends StatelessWidget{


   
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
              
              
            ),
            new Column(children:[
                Text('ACCOUNT'),
                Text('CURRENT BALANCE :'),
                new Column(children:[
                  new Row(children:[
                   new Container(
                      child:FlatButton.icon(
                      icon:Icon(Socicon.money),
                      label:Text("Cash"),
                      onPressed: (){


                      },

                    ),
                      

                      

                      ),

                      new Container(
                      child:FlatButton.icon(
                      icon:Icon(Socicon.bank),
                      label:Text("Bank"),
                      
                      onPressed: (){


                      },

                    ),
                      

                      

                      ),
                       new Container(
                      child:FlatButton.icon(
                      icon:Icon(Socicon.credit_card),
                      label:Text("Credit card"),
                      onPressed: (){


                      },

                    ),
                      

                      

                      ),

                     
                  ],
                  )
                ]),
                new Column(children:[
                  new Row(children: [
                    new Container(
                      margin: const EdgeInsets.all(10.0),
                      height: 48.0,
                      width:300.0,
                      
                      padding: const EdgeInsets.all(5.0),
                      decoration:myBoxDecoration(),
                      
                      child: Text("Transactions",
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.center,
                    
                      ),
                        
                      ),
                  ],
                  ),
                  new Row(children: [

                    new Container(
                      child:FlatButton.icon(
                      icon:Icon(Socicon.add),
                      label:Text("add"),
                      onPressed: (){


                      },

                    ),
                      

                      

                      ),

                      new Container(
                      child:FlatButton.icon(
                      icon:Icon(Socicon.edit,size:30),
                      label:Text("edit"),
                      
                      onPressed: (){


                      },

                    ),
                      

                      

                      ),

                      new Container(
                      child:FlatButton.icon(
                      icon:Icon(Socicon.remove_circle),
                      label:Text("remove"),
                      onPressed: (){


                      },

                    ),
                      

                      

                      ),
                       
                    ],
                    ),
                  ],),
                  new Row(children: [
                        new Container(
                          margin: const EdgeInsets.all(10.0),
                      height: 48.0,
                      width:300.0,
                      
                      padding: const EdgeInsets.all(.0),
                      decoration:myBoxDecoration(),
                      
                      child: Text("No transaction",
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.center,
                    
                        )
                        ),


                      ],
                      ),
                
                ],),
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
                      

                      

                      ),
                       
                    ],
                    ),
                
                
              ],

        )
      );

    }
}





    
              
          
          
        

        
      
      
    
