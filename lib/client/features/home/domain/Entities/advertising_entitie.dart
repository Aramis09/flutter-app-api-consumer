import 'package:flutter_aplication_bloc/client/features/home/interfaces/advertising_list.dart';

abstract class AdvertisingEntitie {
  int id;
  String title;
  String summary;
  String aside;
  String footer;
  String image;
  String date;
  List<SectionsView> sectionsViews;

  AdvertisingEntitie({
    required this.id,
    required this.title,
    required this.summary,
    required this.aside,
    required this.footer,
    required this.image,
    required this.date,
    required this.sectionsViews,
  });
}
