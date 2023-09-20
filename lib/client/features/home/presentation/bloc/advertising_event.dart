part of 'advertising_bloc.dart';

//@immutable
abstract class AdvertisingEvent {}

class GetLastAdvertsings extends AdvertisingEvent {
  int page;
  GetLastAdvertsings({required this.page});
}

class GetAdvertisingDetail extends AdvertisingEvent {
  int id;
  GetAdvertisingDetail({required this.id});
}
