import 'package:carros/pages/carros/home_page.dart';
import 'package:carros/pages/login/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/utils/sql/db_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carros/firebase/firebase_service.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Inicializar o banco de dados
    Future futureA = DatabaseHelper.getInstance().db;

    Future futureB = Future.delayed(Duration(seconds: 3));

    // Usuario
    Future<FirebaseUser> futureC = FirebaseAuth.instance.currentUser();

    Future.wait([futureA,futureB,futureC]).then((List values) {
      FirebaseUser fUser = values[2];

      if (fUser != null) {
        firebaseUserUid = fUser.uid;

        push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage(), replace: true);
      }
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
