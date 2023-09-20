import 'package:flutter_aplication_bloc/client/features/home/data/models/advertising_model.dart';
import 'package:flutter_aplication_bloc/client/features/home/data/sources/advertising_dataSource_impl.dart';
import 'package:flutter_aplication_bloc/client/features/home/domain/respositories_bases/advertising_reposiroy_base.dart';
import 'package:http/http.dart' as http;

class AdvertisingRepository extends AdvertisingRepositoryBase {
  @override
  Future<List<AdvertisingModel>> getLastAdvertisings(int page) async =>
      await AdvertisingDataSource(client: http.Client())
          .getLastAdvertisings(page);
  @override
  Future<AdvertisingModel> getAdvertisingDetail(int id) async =>
      await AdvertisingDataSource(client: http.Client())
          .getAdvertisingDetail(id);
}
