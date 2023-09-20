import 'package:flutter/material.dart';

class TextBetweenLines extends StatelessWidget {
  String text;
  TextBetweenLines({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    int textLength = text.length;

    int widhtLine = (100 - textLength).abs();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widhtLine.toDouble(), // Grosor de la línea
          height: 2, // Altura de la línea
          color: const Color(0xFFE5E5E5), // Color de la línea
          margin: const EdgeInsets.all(8), // Margen alrededor de la línea
        ),
        Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
        ),
        Container(
          width: widhtLine.toDouble(), // Grosor de la línea
          height: 2, // Altura de la línea
          color: const Color(0xFFE5E5E5), // Color de la línea
          margin: const EdgeInsets.all(8), // Margen alrededor de la línea
        )
      ],
    );
  }
}
