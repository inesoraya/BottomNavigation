import 'package:coba1/register/konsultasi_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'card.dart';
import 'konsultasi_page.dart';
import 'catatan_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 2;
  bool _isHomeHovered = false;

  final List<Widget> _pages = [
    CatatanPage(),
    Center(child: _buildPageText('Jelajahi')),
    Center(child: _buildPageText('Beranda')),
    KonsultasiPage(),
    Center(child: _buildPageText('Profil')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static Widget _buildPageText(String text, {bool isBold = false}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: Colors.black87,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.calculate, "Catatan", 0),
              _buildNavItem(Icons.menu_book, "Jelajahi", 1),
              SizedBox(width: 48), // Ruang untuk tombol Home
              _buildNavItem(Icons.chat_bubble_outline, "Konsultasi", 3),
              _buildNavItem(Icons.person_outline, "Profil", 4),
            ],
          ),
        ),
      ),
      floatingActionButton: MouseRegion(
        onEnter: (_) => setState(() => _isHomeHovered = true),
        onExit: (_) => setState(() => _isHomeHovered = false),
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isHomeHovered = true),
          onTapUp: (_) => setState(() => _isHomeHovered = false),
          onTap: () => _onItemTapped(2),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            width: _isHomeHovered ? 80 : 70,
            height: _isHomeHovered ? 80 : 70,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 243, 155, 228),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: _isHomeHovered
                  ? [
                      BoxShadow(
                          color: const Color.fromARGB(255, 161, 77, 172)
                              .withOpacity(0.6),
                          blurRadius: 15)
                    ]
                  : [],
            ),
            child: Icon(Icons.home, color: Colors.white, size: 36),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: _selectedIndex == index
            ? Matrix4.diagonal3Values(1.2, 1.2, 1) // Efek membesar saat dipilih
            : Matrix4.identity(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: _selectedIndex == index
                  ? const Color.fromARGB(255, 173, 3, 131)
                  : Colors.grey.shade600,
              size: 28,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: _selectedIndex == index
                    ? const Color.fromARGB(255, 235, 116, 229)
                    : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
