import 'package:flutter/material.dart';
import 'home_page.dart'; // Import halaman HomePage

class PageAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Selamat Datang"),
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding:
                EdgeInsets.all(16.0), // Padding agar tidak menempel ke tepi
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood_rounded, // Menambahkan ikon agar lebih menarik
                  size: 100,
                  color: Colors.deepOrangeAccent,
                ),
                SizedBox(height: 20), // Jarak antara ikon dan teks
                Text(
                  "Selamat Datang di Aplikasi Kuliner!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Temukan berbagai makanan, minuman, dan dessert favoritmu!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 30), // Jarak antara teks dan tombol
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman HomePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Mulai Sekarang",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
