import 'package:flutter/material.dart';
import 'package:project/pages/subscriberchart.dart';
import 'package:project/pages/subscriberseries.dart';
import 'addmyexpenses.dart';
import 'socicon_icons.dart';
import 'image_banner.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Expensepage extends StatelessWidget{
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "Food",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "Acom",
      subscribers: 11000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "Fare",
      subscribers: 12000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "Prsnl",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: setPage(context),
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
  Widget setPage(BuildContext context) {
    return Stack(
          children: <Widget>[
            Container(
              child: ImageBanner('assets/expenses.jpg')
            ),
              Card(
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.only(left: 20, right: 18.0, top: 20.0, bottom: 0.0),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('MY EXPENSES', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text('\nWeekly', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SubscriberChart(
                      data: data,
                    )
                  ],
                )
              ),
        ]
    );
  }
  
}

