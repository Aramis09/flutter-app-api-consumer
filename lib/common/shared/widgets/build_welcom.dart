import 'package:flutter/material.dart';

class BuildWelcomeWidget extends StatelessWidget {
  const BuildWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Image.asset("assets/logo.png", scale: 1.5),
        ),
        Text(
          "Bienvenido",
          style: TextStyle(fontSize: 40, color: colors.inversePrimary),
        ),
      ],
    );
  }
}
