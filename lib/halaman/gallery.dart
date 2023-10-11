import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  GalleryState createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Center(child: Text("Halaman Gallery")),
          ],
        ),
      ),
    );
  }
}
