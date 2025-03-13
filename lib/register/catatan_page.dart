import 'package:flutter/material.dart';

class CatatanPage extends StatelessWidget {
  final List<Map<String, String>> foodRecords = [
    {"meal": "Sarapan", "menu": "Oatmeal dengan madu"},
    {"meal": "Snack Pagi", "menu": "Almond & Pisang"},
    {"meal": "Makan Siang", "menu": "Nasi merah, ayam panggang, dan sayur"},
    {"meal": "Snack Sore", "menu": "Yogurt dengan granola"},
    {"meal": "Makan Malam", "menu": "Sup ayam dan brokoli"},
    {"meal": "Sarapan", "menu": "Oatmeal dengan madu"},
    {"meal": "Snack Pagi", "menu": "Almond & Pisang"},
    {"meal": "Makan Siang", "menu": "Nasi merah, ayam panggang, dan sayur"},
    {"meal": "Snack Sore", "menu": "Yogurt dengan granola"},
    {"meal": "Makan Malam", "menu": "Sup ayam dan brokoli"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      itemCount: foodRecords.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.fastfood, color: Colors.orange.shade700),
          title: Text(
            foodRecords[index]["meal"]!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(foodRecords[index]["menu"]!),
          onTap: () {},
        );
      },
    );
  }
}
