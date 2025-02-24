import 'package:flutter/material.dart';

class InfoPlaceWidget extends StatelessWidget {
  final String icon;
  final String label;
  const InfoPlaceWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

          decoration: BoxDecoration(
            color: Color.fromRGBO(237, 237, 237, 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Image.asset(icon, height: 16,),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Roboto",
            color: Color.fromRGBO(126, 126, 126, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
