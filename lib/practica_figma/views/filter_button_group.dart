import 'package:flutter/material.dart';
import 'package:flutter_application_1/practica_figma/views/filter_button_widgets.dart';

class FilterButtonGroup extends StatefulWidget {
  const FilterButtonGroup({super.key});

  @override
  State<FilterButtonGroup> createState() => _FilterButtonGroupState();
}

class _FilterButtonGroupState extends State<FilterButtonGroup> {
  int _selectedIndex = 0;
  final List<String> filters = ["Most Viewed", "Nearby", "Latest"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 28),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(filters.length, (index) {
            return FilterButtonWidget(
              label: filters[index],
              isSelected: _selectedIndex == index,
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
            );
          }),
        ),
      ),
    );
  }
}
