import 'package:flutter/material.dart';
import 'menu_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Pilihan Kategori'),
          // backgroundColor: Colors.blueAccent,
          // centerTitle: true,
          ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card Informasi
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: double.infinity, // Membuat Card mengisi lebar maksimal
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pilihan Kategori",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Pilih kategori sesuai keinginan Anda.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Tambahkan Expanded untuk membuat ListView scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Card Menu (Klik akan berpindah ke MenuPage)
                    buildCategoryCard(
                      context: context,
                      imagePath: 'assets/image/makanan.png',
                      title: "Menu",
                      description: "Berbagai pilihan makanan sehat dan lezat.",
                      cardColor: Colors.orangeAccent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuPage()),
                        );
                      },
                    ),
                    SizedBox(height: 10),

                    // Card Olahraga
                    buildCategoryCard(
                      context: context,
                      imagePath: 'assets/image/olahraga.png',
                      title: "Olahraga",
                      description:
                          "Panduan dan tips olahraga untuk kebugaran Anda.",
                      cardColor: Colors.greenAccent,
                      onTap: () {
                        // Bisa diisi navigasi lain
                      },
                    ),
                    SizedBox(height: 10),

                    // Card Artikel
                    buildCategoryCard(
                      context: context,
                      imagePath: 'assets/image/artikel.png',
                      title: "Artikel",
                      description:
                          "Baca berbagai artikel menarik dan informatif.",
                      cardColor: Colors.blueAccent,
                      onTap: () {
                        // Bisa diisi navigasi lain
                      },
                    ),
                    SizedBox(height: 10),

                    // Tambahkan lebih banyak kategori jika diperlukan
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat Card kategori
  Widget buildCategoryCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String description,
    required Color cardColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: cardColor,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 158,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
