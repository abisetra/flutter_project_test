import 'package:flutter/material.dart';

class Web extends StatefulWidget {
  WebState createState() => WebState();
}

class WebState extends State<Web> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Center(child: Text("Halaman Web")),
          ],
        ),
      ),
    );
  }
}
