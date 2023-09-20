import 'dart:convert';

import 'package:flutter_aplication_bloc/client/features/home/data/models/advertising_model.dart';
import 'package:flutter_aplication_bloc/client/features/home/interfaces/advertising_list.dart';
import 'package:http/http.dart';

class AdvertisingMappers {
  static List<AdvertisingModel> convertListToEntitieList(
    Response advertisinListRes,
  ) {
    AdvertisingInterface responseMapped =
        AdvertisingInterface.fromJson(json.decode(advertisinListRes.body));

    List<AdvertisingModel> listAdvertising = responseMapped.data
        .map((advertisingDetails) =>
            AdvertisingModel.fromJson(advertisingDetails))
        .toList();
    return listAdvertising;
  }

  static AdvertisingModel converToEntitieAdvertisingDetail(
      Response advertisingResponse) {
    AdvertisingDetail responseMapped = AdvertisingDetail.fromJson(
        jsonDecode(advertisingResponse.body)["data"]);
    print(
        "${jsonDecode(advertisingResponse.body)["data"]} <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    AdvertisingModel advertisingDetailMapped =
        AdvertisingModel.fromJson(responseMapped);
    return advertisingDetailMapped;
  }
}
