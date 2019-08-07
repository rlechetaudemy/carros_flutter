
import 'package:carros/pages/carros/home_page.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
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

    Future.delayed(Duration(seconds: 2),(){
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
