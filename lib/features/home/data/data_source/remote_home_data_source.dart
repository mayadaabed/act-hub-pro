import 'package:act_hub_project/core/network/app_api.dart';
import 'package:act_hub_project/features/home/data/response/home_response.dart';

abstract class RemoteHomeDataSource {
  Future<HomeResponse> homeData();
}

class RemoteHomeDataSourceImpl extends RemoteHomeDataSource {
  final AppApi _appApi;

  RemoteHomeDataSourceImpl(this._appApi);

  @override
  Future<HomeResponse> homeData() async {
    return await _appApi.home();
  }
}
