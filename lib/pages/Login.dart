
import 'package:flutter/material.dart';
import 'package:project/Util/Router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/budget diz.jpg"), fit: BoxFit.cover,),
          ),
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Container(
                padding: EdgeInsets.all(8.0),
                child: Image.asset('assets/logo.gif'),
              ),
              Padding(
                
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 15.0),
                child: Text(
                  "B U D G E T  IT",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                 margin: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                child: generateTextField("Username"),
                
              ),
              Container(
                child: generateTextField("Password"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(8.0, 15.0, 10.0, 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 18.0,
                         // color: Theme.of(context).accentColor,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              InkWell(
                child: buildLoginButton(),
                onTap: () =>
                    Navigator.pushReplacementNamed(context, landingRoute),
              ),

              InkWell(
                
                child: buildRegisterButton(),
                onTap: () =>
                    Navigator.pushReplacementNamed(context, homeRoute),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget generateTextField(_texthint) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 5.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: _texthint,
          hintStyle: TextStyle(
            fontSize: 18.0,
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5.0),
          // ),
          prefixIcon:
              _texthint == "Username" ? Icon(Icons.person) : Icon(Icons.lock),
          suffixIcon: _texthint == "Password"
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                )
              : null,
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.all(10.0),
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(35.0),
        color: Theme.of(context).accentColor,
      ),
      child: Center(
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

   Widget buildRegisterButton() {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(35.0),
        color: Colors.cyan,
      ),
      child: Center(
        child: Text(
          "Register",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
