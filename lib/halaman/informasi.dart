import 'package:flutter/material.dart';

class Informasi extends StatefulWidget {
  InformasiState createState() => InformasiState();
}

class InformasiState extends State<Informasi> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Center(child: Text("Halaman Informasi")),
          ],
        ),
      ),
    );
  }
}
