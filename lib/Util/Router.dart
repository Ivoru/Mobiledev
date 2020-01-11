import 'package:flutter/material.dart';
import 'package:project/pages/LandingPage.dart';
import 'package:project/pages/budget.dart';
import 'package:project/pages/expense.dart';
import 'package:project/pages/reminder.dart';
import 'package:project/pages/settings.dart';

import '../pages/Login_page.dart';
import '../pages/home.dart';

import 'package:project/pages/signup_page.dart';

const String loginRoute = '/';
const String landingRoute = '/landing';
const String homeRoute = '/HomePage';
const String reminderDetailsRoute = '/reminder';
const String budgetDetailsRoute = '/budget';
const String expenseDetailsRoute = '/expense';
const String settingDetailsRoute = '/settings';
const String signUpDetailsRoute = '/settings';

class Router{
  
   static MaterialPageRoute createPageRoute(route){
      return MaterialPageRoute(builder: (_) => route);
   }

   static Route<dynamic> generateRoute(RouteSettings settings){
       switch (settings.name) {
         case loginRoute:
             return createPageRoute(LoginPage());
         case landingRoute:
             return createPageRoute(LandingPage()); 
         case homeRoute:
             return createPageRoute(HomePage());
         case reminderDetailsRoute:
             return createPageRoute(Reminderpage());
         case budgetDetailsRoute:
             return createPageRoute(Budgetpage()); 
         case expenseDetailsRoute:
             return createPageRoute(Expensepage()); 
          case settingDetailsRoute:
             return createPageRoute(Settingspage());
          case signUpDetailsRoute:
             return createPageRoute(SignUpPage());          
         default:
             return null;
       }
      
   }

}