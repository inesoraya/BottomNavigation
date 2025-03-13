import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan home_page.dart ada dan benar

class CardAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            // title: Text("ADEK"),
            // backgroundColor: Colors.blueAccent,
            // centerTitle: true,
            ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                // Navigasi ke halaman HomePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 250, 130, 214), // Warna latar belakang
                  borderRadius: BorderRadius.circular(10), // Sudut melengkung
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon(
                    //   Icons.play_arrow_rounded,
                    //   size: 50,
                    //   color: Colors.white,
                    // ),
                    // SizedBox(height: 10),
                    Text(
                      "Yuk Kita Mulai!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
