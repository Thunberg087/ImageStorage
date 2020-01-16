import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'screens/login.dart';
import 'navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: DoubleBackToCloseApp(
          child: LoginScreen(),
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginScreen(),
        '/navigation': (BuildContext context) => new NavigationWidget(),
      },
    );
  }
}
