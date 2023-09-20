import 'package:flutter_aplication_bloc/client/features/home/domain/Entities/advertising_entitie.dart';
import 'package:flutter_aplication_bloc/client/features/home/interfaces/advertising_list.dart';

class AdvertisingModel extends AdvertisingEntitie {
  AdvertisingModel({
    required id,
    required title,
    required summary,
    required aside,
    required footer,
    required image,
    required date,
    required sectionsViews,
  }) : super(
          id: id,
          title: title,
          summary: summary,
          aside: aside,
          footer: footer,
          image: image,
          date: date,
          sectionsViews: sectionsViews,
        );

  factory AdvertisingModel.fromJson(AdvertisingDetail json) {
    return AdvertisingModel(
      id: json.id,
      title: json.title,
      summary: json.summary,
      aside: json.aside,
      footer: json.footer,
      image: json.image,
      date: json.date,
      sectionsViews: json.sectionsViews,
    );
  }
}
