
import 'package:carros/pages/carros/home_page.dart';
import 'package:carros/pages/favoritos/db_helper.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // Inicializar o banco de dados
    Future futureA = DatabaseHelper.getInstance().db;
    
    Future futureB = Future.delayed(Duration(seconds: 5));

    Future.wait([futureA,futureB]).then((List values){

      push(context, HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
