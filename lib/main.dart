import 'package:demo/route_generator.dart';
import 'package:flutter/material.dart';


void main() {

  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: RouterGenerator.generateRoute,
  ));
}


