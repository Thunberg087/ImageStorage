import 'package:flutter/material.dart';
import 'package:image_storage/screens/logged_in/settings.dart';
import 'screens/logged_in/home.dart';
import 'screens/logged_in/upload.dart';

class NavigationWidget extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _NavigationWidgetState();
  }
}



class _NavigationWidgetState extends State<NavigationWidget> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    UploadScreen(),
    SettingsScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload),
            title: Text('Upload'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings')
          )
        ],
      ),
    );
  }
}