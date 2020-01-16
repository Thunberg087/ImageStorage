import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alla bilder"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top:5.0),
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final path =
            "http://78.71.86.80/imageStorageAPI/storage/" + photos[index].name;
        return FittedBox(
            child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Image.network(path)),
            fit: BoxFit.cover);
      },
    ));
  }
}

class Photo {
  final String name;

  Photo({this.name});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      name: json['name'] as String,
    );
  }
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('http://78.71.86.80/imageStorageAPI/images.json');

  return parsePhotos(response.body);
}
