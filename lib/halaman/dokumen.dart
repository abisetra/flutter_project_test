import 'package:flutter/material.dart';

class Dokumen extends StatefulWidget {
  DokumenState createState() => DokumenState();
}

class DokumenState extends State<Dokumen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dokumen"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Center(child: Text("Halaman Dokumen")),
          ],
        ),
      ),
    );
  }
}
