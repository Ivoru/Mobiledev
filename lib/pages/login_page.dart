import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/database/database_actions.dart';
import 'package:project/pages/LandingPage.dart';
import 'package:project/pages/signup_page.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 45.0, left: 45.0),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                
                padding: const EdgeInsets.only(bottom:15.0),
                child: Image.asset('assets/budgeet.png', width: 250 , height: 250),
              ),  
              
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
                    child: Text("Login"),
                    onPressed: () async {
                          Future<List<Map<String, dynamic>>> x = DatabaseActions.getUsers(_username.text, _password.text);
                          Map<String, dynamic> real = {};
                          await x.then((val) {
                            try {
                              real = val[0];
                            } catch (e) {
                              _errorLogin(context);
                            }
                          });
                          if(real.isNotEmpty) {
                              DatabaseActions.setLoggedIn(real['id'],real['username'],real['password']);
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => LandingPage() ));
                          }
                        },
                  ),
                  Container(width: 20.0,),
                RaisedButton(
                    child: Text("Sign up"),
                    onPressed: (){
                          Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => SignUpPage() ));
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

void _errorLogin(BuildContext context) {
  showDialog(
                      context: context,
                      builder: (context) {
                        
                        return AlertDialog(
                          title: Text('Error!'),
                          content: Text("Wrong Username or password!"),
                        );
                      });
}