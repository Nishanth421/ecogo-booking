import 'package:flutter/material.dart';

class TripTypeSelector extends StatefulWidget {
  @override
  _TripTypeSelectorState createState() => _TripTypeSelectorState();
}

class _TripTypeSelectorState extends State<TripTypeSelector> {
  String selectedType = "Oneway"; // default selection

  final List<String> tripTypes = ["Oneway", "Round trip", "Multi-city"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tripTypes.map((type) {
          bool isSelected = selectedType == type;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(type),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    selectedType = type;
                  });
                  // Optional: notify parent or bloc
                  // _bloc.updateTripType(type);
                }
              },
              selectedColor: Colors.blue,
              backgroundColor: Colors.grey[200],
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}