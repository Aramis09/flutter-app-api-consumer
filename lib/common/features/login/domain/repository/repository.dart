import '../../data/models/login_user_model.dart';
import '../sources/data_sources_bases.dart';

abstract class LoginRespositoryBases {
  DataSourcesLoginBases dataSources;
  LoginRespositoryBases({required this.dataSources});

  Future<LoginUserModel> verifyDataLogin(
      {required String user, required String password});
}

class LoginRespositoryImpl extends LoginRespositoryBases {
  LoginRespositoryImpl({required super.dataSources});
  @override
  Future<LoginUserModel> verifyDataLogin(
      {required String user, required String password}) async {
    LoginUserModel response =
        await dataSources.verifyUser(user: user, password: password);
    return response;
  }
}
