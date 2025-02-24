import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButtonWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 120,
      child: ChoiceChip(
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 16,
              color:
                  isSelected ? Colors.white : Color.fromRGBO(197, 197, 197, 1),
            ),
          ),
        ),
        selected: isSelected,
        backgroundColor: const Color.fromRGBO(251, 251, 251, 1),
        selectedColor: const Color.fromRGBO(47, 47, 47, 1),
        showCheckmark: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: isSelected ? Colors.black : Colors.white),
        ),
        onSelected: (_) => onTap(),
      ),
    );
  }
}
