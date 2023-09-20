part of 'advertising_bloc.dart';

@immutable
sealed class AdvertisingState {
  final List<AdvertisingModel>? lastAdvertising;
  final AdvertisingModel? advertisingDetail;
  const AdvertisingState(this.lastAdvertising, this.advertisingDetail);
  AdvertisingInitial copyWith(
      List<AdvertisingModel>? newList, AdvertisingModel? newDetail);
}

final class AdvertisingInitial extends AdvertisingState {
  const AdvertisingInitial(super.lastAdvertising, super.advertisingDetail);
  @override
  AdvertisingInitial copyWith(
      List<AdvertisingModel>? newList, AdvertisingModel? newDetail) {
    return AdvertisingInitial(
        newList ?? lastAdvertising, newDetail ?? advertisingDetail);
  }
}

class AdvertisingAllLoadign extends AdvertisingState {
  const AdvertisingAllLoadign(super.lastAdvertising, super.advertisingDetail);

  @override
  AdvertisingInitial copyWith(
      List<AdvertisingModel>? newList, AdvertisingModel? newDetail) {
    return AdvertisingInitial(newList, newDetail);
  }
}

class AdvertisingAllSucces extends AdvertisingState {
  const AdvertisingAllSucces(super.lastAdvertising, super.advertisingDetail);

  @override
  AdvertisingInitial copyWith(
      List<AdvertisingModel>? newList, AdvertisingModel? newDetail) {
    return AdvertisingInitial(newList, newDetail);
  }
}
