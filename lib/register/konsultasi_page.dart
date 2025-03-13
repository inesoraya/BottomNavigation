import 'package:flutter/material.dart';

class KonsultasiPage extends StatelessWidget {
  final List<Map<String, String>> consultations = [
    {"name": "Dr. Andi", "topic": "Gizi Seimbang"},
    {"name": "Dr. Rina", "topic": "Diet Keto"},
    {"name": "Dr. Budi", "topic": "Manajemen Berat Badan"},
    {"name": "Dr. Siti", "topic": "Diet Vegetarian"},
    {"name": "Dr. Andi", "topic": "Gizi Seimbang"},
    {"name": "Dr. Rina", "topic": "Diet Keto"},
    {"name": "Dr. Budi", "topic": "Manajemen Berat Badan"},
    {"name": "Dr. Siti", "topic": "Diet Vegetarian"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: consultations.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.purple.shade100,
            child: Icon(Icons.person, color: Colors.purple.shade700),
          ),
          title: Text(
            consultations[index]["name"]!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(consultations[index]["topic"]!),
          onTap: () {},
        );
      },
    );
  }
}
