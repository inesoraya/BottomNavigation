import 'package:flutter/material.dart';

class Dashboard1Page extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboard1Page> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    Center(child: _buildPageText('Catatan Menu')),
    Center(child: _buildPageText('Jelajahi')),
    Center(child: _buildPageText('Beranda', isBold: true)),
    Center(child: _buildPageText('Konsultasi')),
    Center(child: _buildPageText('Profil')),
  ];

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
              _buildNavItem(Icons.calculate, "Catatan"),
              _buildNavItem(Icons.menu_book, "Jelajahi"),
              SizedBox(width: 48), // Ruang untuk tombol Home
              _buildNavItem(Icons.chat_bubble_outline, "Konsultasi"),
              _buildNavItem(Icons.person_outline, "Profil"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 243, 155, 228),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: Icon(Icons.home, color: Colors.white, size: 36),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.grey.shade600,
          size: 28,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
