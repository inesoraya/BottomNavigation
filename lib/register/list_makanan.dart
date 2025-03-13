import 'package:flutter/material.dart';

class ListMakanan extends StatelessWidget {
  final List<String> makanan = [
    "Nasi Goreng",
    "Sate Ayam",
    "Rendang",
    "Bakso",
    "Mie Goreng",
    "Gado-Gado",
    "Ayam Bakar",
    "Soto Ayam",
    "Pempek",
    "Nasi Padang"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Daftar Makanan"),
        // backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon kembali
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(makanan.length, (index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(
                  Icons.fastfood,
                  size: 50,
                  color: Colors.orangeAccent,
                ),
                title: Text(
                  makanan[index],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Makanan lezat dan menggugah selera"),
              ),
            );
          }),
        ),
      ),
    );
  }
}
