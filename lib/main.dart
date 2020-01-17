import 'package:carros/splash_page.dart';
import 'package:carros/utils/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EventBus>(
          builder: (context) => EventBus(),
          dispose: (context, bus) => bus.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white
        ),
        home: SplashPage(),
      ),
    );
  }
}