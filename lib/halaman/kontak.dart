import 'package:flutter/material.dart';

class Kontak extends StatefulWidget {
  KontakState createState() => KontakState();
}

class KontakState extends State<Kontak> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kontak"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Center(child: Text("Halaman Kontak")),
          ],
        ),
      ),
    );
  }
}
