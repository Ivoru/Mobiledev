
import 'package:flutter/material.dart';
import 'package:project/Util/Router.dart';
import 'package:project/pages/budget.dart';
import 'package:project/pages/expense.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/reminder.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPage createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> with WidgetsBindingObserver {
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  final String pageTitle = "Home";
  int _selectedIndex = 0;

  final List<Map<String, Object>> _pageOptions = [
    {"page": HomePage(), "title": "Home"},
    {"page": Reminderpage(), "title": "Reminder"},
    {"page": Budgetpage(), "title": "Budget"},
    {"page": Expensepage(), "title": "Expense"},
    
  ];

  void _onNavigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(_pageOptions[_selectedIndex]["title"]),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          )
        ],
      ),
      drawer: drawerbuilder(),
      body: _pageOptions[_selectedIndex]['page'],
      bottomNavigationBar: bottomNavigationBuilder(),
    );
  }

  Widget drawerbuilder() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 35.0,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      "assets/CoinPhoto.jpg",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Welcome User',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.list),
                Container(
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.exit_to_app),
                Container(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            onTap: () => Navigator.popAndPushNamed(context, loginRoute),
          ),
        ],
      ),
    );
  }

  Widget bottomNavigationBuilder() {
    return BottomNavigationBar(
    unselectedItemColor: Colors.black,
      fixedColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
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
      ],
      currentIndex: _selectedIndex,
      onTap: _onNavigate,
    );
  }
}
