import 'package:flutter/material.dart';
import 'list_makanan.dart'; // Import halaman list makanan

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tidak perlu MaterialApp di sini
      appBar: AppBar(
        // title: Text('Pilih Menu'),
        // backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon kembali
          onPressed: () {
            Navigator.pop(context); // Sekarang bisa kembali
          },
        ),
      ),
      body: GridViewScreen(),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Makanan",
      "icon": Icons.fastfood,
      "color": Colors.redAccent,
      "route": ListMakanan(), // Halaman tujuan saat diklik
    },
    {
      "title": "Minuman",
      "icon": Icons.local_cafe,
      "color": Colors.blueAccent,
      "route": null, // Belum ada halaman untuk minuman
    },
    {
      "title": "Dessert",
      "icon": Icons.icecream,
      "color": Colors.pinkAccent,
      "route": null, // Belum ada halaman untuk dessert
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: menuItems[index]['color'],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: InkWell(
              onTap: () {
                if (menuItems[index]['route'] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => menuItems[index]['route'],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "${menuItems[index]['title']} belum tersedia!")),
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    menuItems[index]['icon'],
                    size: 60,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    menuItems[index]['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
