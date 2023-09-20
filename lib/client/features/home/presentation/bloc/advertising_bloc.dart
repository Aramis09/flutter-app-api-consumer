import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/client/features/home/data/models/advertising_model.dart';
import 'package:flutter_aplication_bloc/client/features/home/data/respositories/advertising_respository_impl.dart';

part 'advertising_event.dart';
part 'advertising_state.dart';

class AdvertisingBloc extends Bloc<AdvertisingEvent, AdvertisingState> {
  AdvertisingBloc() : super(const AdvertisingInitial(null, null)) {
    on<GetLastAdvertsings>(_getLastAdvertsings);
    on<GetAdvertisingDetail>(
        (event, emit) => _getAdvertisingDetail(event, emit));
  }

  void _getAdvertisingDetail(
      GetAdvertisingDetail event, Emitter<AdvertisingState> emit) async {
    AdvertisingModel newDetail =
        await AdvertisingRepository().getAdvertisingDetail(event.id);
    emit(state.copyWith(null, newDetail));
  }

  FutureOr<void> _getLastAdvertsings(
      GetLastAdvertsings event, Emitter<AdvertisingState> emit) async {
    if (state.lastAdvertising != null) return;

    emit(AdvertisingAllLoadign(state.lastAdvertising, state.advertisingDetail));

    List<AdvertisingModel> newList =
        await AdvertisingRepository().getLastAdvertisings(event.page);

    emit(AdvertisingAllSucces(newList, state.advertisingDetail));
  }
}
