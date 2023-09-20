import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/advertising_model.dart';

class CardSlider extends StatelessWidget {
  final AdvertisingModel? advertising;
  final ColorScheme colors;
  const CardSlider(
      {super.key, required this.advertising, required this.colors});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
              onTap: () => context.go('/advertisingDetail/${advertising!.id}'),
              child: _getStackImage(advertising!, colors)),
        ),
      ),
    );
  }

  Widget _getStackImage(AdvertisingModel advertising, ColorScheme colors) =>
      Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
        Image.network(
          '${advertising.image}??""',
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            advertising.date,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: colors.inverseSurface, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            advertising.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: colors.onInverseSurface,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ]);
}
