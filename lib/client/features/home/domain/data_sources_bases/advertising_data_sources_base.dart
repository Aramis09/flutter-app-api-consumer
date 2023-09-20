import 'package:flutter_aplication_bloc/client/features/home/data/models/advertising_model.dart';

abstract class AdvertisingDataSourceBase {
  Future<List<AdvertisingModel>> getLastAdvertisings(int page);

  Future<AdvertisingModel> getAdvertisingDetail(int id);
}
