import 'package:flutter/material.dart';
import 'socicon_icons.dart';


import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override 
    State<StatefulWidget> createState(){
      return MyAppState();
    }


}

class MyAppState extends State<MyApp>{ 
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.red,
      ),
      home: Scaffold(appBar: AppBar(title: Text('Budget It'),),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        fixedColor: Colors.red,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
                        _selectedPage = index;

          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("") 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text("") 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text("") 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            title: Text("") 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("") 
          ),
        ],
      ),
      ),
    );
  }
}

