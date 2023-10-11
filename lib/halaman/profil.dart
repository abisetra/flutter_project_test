import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profil extends StatefulWidget {
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profil"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text("SI 21A2",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  )),
            ),
            CircleAvatar(
              radius:
                  175, // Sesuaikan dengan ukuran lingkaran yang Anda inginkan
              backgroundImage: AssetImage(
                  "/picture/profile_pictures.jpg"), // Ganti path gambar sesuai dengan lokasi gambar Anda
            ),
            Card(
              color: Colors.tealAccent,
              child: ListTile(
                title: Text(
                  "NAMA",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                subtitle: Text(
                  "ABIYYU SETRAYANA",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(105, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
