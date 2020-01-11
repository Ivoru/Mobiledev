import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/database/database_actions.dart';

class SignUpPage extends StatefulWidget {
  
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _username = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(

                  hintText: "Username",
                  icon: Icon(Icons.person),
                  labelText: "Username"
                  ),
                controller: _username,
                ),
                Container(
                  height: 10.0
                ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(Icons.vpn_key),
                  labelText: "Password",
                  ),
                controller: _password,
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () async {
                      await DatabaseActions.insertUser({
                        'username': _username.text, 
                        'password': _password.text
                        });
                      showDialog(
                      context: context,
                      builder: (context) {
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        });
                        return AlertDialog(
                          title: Text('Success!'),
                          content: Text("You can now login"),
                        );
                      });
                    },
                    child: Text("Submit"),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}

