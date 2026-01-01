import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../gen/colors.gen.dart';
import '../../../bloc/dashboard_bloc.dart';

class FilterFlights extends StatefulWidget {
  DashboardBloc? bloc;
  FilterFlights({super.key,this.bloc});
  @override
  _FilterFlightsState createState() => _FilterFlightsState();
}

class _FilterFlightsState extends State<FilterFlights> {
  FilterTypes selectedType = FilterTypes.Recommended;

  final List<FilterTypes> tripTypes = FilterTypes.values;

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
              label: Text(type.label),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    selectedType = type;
                  });
                  widget.bloc?.flightFilter(type:selectedType);
                }
              },
              checkmarkColor: ColorName.white,
              selectedColor: ColorName.darkBlue,
              backgroundColor: ColorName.background,
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

extension FilterTypesX on FilterTypes {
  String get label {
    switch (this) {
      case FilterTypes.Recommended:
        return "Recommended";
      case FilterTypes.Cheapest:
        return "Cheapest";
      case FilterTypes.Fastest:
        return "Fastest";
    }
  }
}