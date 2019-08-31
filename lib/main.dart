import 'package:carros/pages/favoritos/favoritos_bloc.dart';
import 'package:carros/splash_page.dart';
import 'package:flutter/material.dart';

final favoritosBloc = FavoritosBloc();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white
      ),
      home: SplashPage(),
    );
  }
}

// Dispose !!!!