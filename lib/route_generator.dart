import 'package:demo/pages/details.dart';
import 'package:demo/pages/home.dart';
import 'package:demo/pages/login.dart';
import 'package:flutter/material.dart';



class RouterGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final Map arg = settings.arguments;

    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => Login());
      case '/home':
        return MaterialPageRoute(builder: (context) => Home(
          username: ''/*arg['username']*/,
        ));
      case '/details':
        return MaterialPageRoute(builder: (context) => Details(
          anime: arg['anime'],
        ));
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}