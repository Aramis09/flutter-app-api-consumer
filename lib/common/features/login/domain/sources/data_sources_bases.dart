import '../../data/models/login_user_model.dart';

abstract class DataSourcesLoginBases {
  Future<LoginUserModel> verifyUser(
      {required String user, required String password});
}
