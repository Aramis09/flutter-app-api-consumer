import 'package:flutter_aplication_bloc/client/features/home/data/mappers/advertising_mappers.dart';
import 'package:flutter_aplication_bloc/client/features/home/data/models/advertising_model.dart';
import 'package:flutter_aplication_bloc/client/features/home/domain/data_sources_bases/advertising_data_sources_base.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AdvertisingDataSource extends AdvertisingDataSourceBase {
  final http.Client client;

  // String baseUrl = "https://8e7e-170-254-63-123.ngrok.io";
  String baseUrl = "https://servidor-unse.onrender.com";

  AdvertisingDataSource({required this.client});

  @override
  Future<List<AdvertisingModel>> getLastAdvertisings(int page) async {
    return await _makeRequestGetListAdvertising(
        '$baseUrl/advertising/getAdversiting?page=${page}');
  }

  @override
  Future<AdvertisingModel> getAdvertisingDetail(int id) async {
    return _makeRequestAdvertisingDetail(
        '$baseUrl/advertising/getAdversiting/$id');
  }

//! private method----------------------------------------------------------------

  Future<AdvertisingModel> _makeRequestAdvertisingDetail(String url) async {
    final response = await _makeRequest(url);
    print(response.body);
    if (response.statusCode == 200) {
      AdvertisingModel mappedAdvertisingDetail =
          AdvertisingMappers.converToEntitieAdvertisingDetail(response);
      print(
          "-----------------------------------------------------------------------<");
      print(mappedAdvertisingDetail);
      return mappedAdvertisingDetail;
    }
    throw Error();
  }

  Future<List<AdvertisingModel>> _makeRequestGetListAdvertising(
      String url) async {
    final response = await _makeRequest(url);
    if (response.statusCode == 200) {
      List<AdvertisingModel> mappedAdvertising =
          AdvertisingMappers.convertListToEntitieList(response);

      return mappedAdvertising;
    }
    throw Error();
  }

  Future<Response> _makeRequest(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'auth-secret-key': 'CLAVESECRETA'
      },
    );
    return response;
  }
}
