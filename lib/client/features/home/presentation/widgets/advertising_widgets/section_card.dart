import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/client/features/home/interfaces/advertising_list.dart';

class CardSection extends StatelessWidget {
  SectionsView sectionDetail;
  CardSection({super.key, required this.sectionDetail});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: Color.fromARGB(255, 255, 255, 255),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              _ItemColumnsSection().getCustomTitle(
                  colors, sectionDetail.title, sectionDetail.createdAt),
              _ItemColumnsSection().getCustomImage('${sectionDetail.topImage}'),
              const SizedBox(
                height: 20,
              ),
              _ItemColumnsSection()
                  .getCustomText('${sectionDetail.textPartOne}'),
              const SizedBox(
                height: 20,
              ),
              _ItemColumnsSection()
                  .getCustomImage('${sectionDetail.middleImage}'),
              const SizedBox(
                height: 20,
              ),
              _ItemColumnsSection()
                  .getCustomText('${sectionDetail.textPartTwo}'),
              const SizedBox(
                height: 20,
              ),
              _ItemColumnsSection()
                  .getCustomImage('${sectionDetail.belowImage}')
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemColumnsSection {
  Widget getCustomTitle(ColorScheme colors, String title, String date) =>
      Container(
          color: colors.primary,
          height: 80,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ));

  Widget getCustomImage(String imgUrl) => Padding(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Text(
              "esto me da problemas pero el comentario de la derecha tiene todo"), //Image.network('$imgUrl??""')
        ),
      );
  Widget getCustomText(String text) => Padding(
        padding: const EdgeInsets.all(20),
        child: Text(text),
      );
}
