import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './util/Router.dart';

void main() {
  // Force device orientation to portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: Router.generateRoute,
      initialRoute: loginRoute,
    );
  }
}


