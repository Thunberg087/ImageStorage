import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  List<int> _list = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alla bilder"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 160,
        childAspectRatio: 3,
        children: _list.map((value) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Container(
                child: Image.network(
              'https://picsum.photos/250?imagd=9',
            )),
          );
        }).toList(),
      ),
    );
  }
}
