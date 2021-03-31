import 'package:appgdg/models/covid_model.dart';
import 'package:appgdg/util/constants.dart';
import 'package:dio/dio.dart';

class CovidRepository {
  Future<List<CovidModel>> get(String initials) async {
    Dio dio;

    dio = Dio(BaseOptions(
        baseUrl: URL_BASE + ENDPOINT, headers: {'Authorization': COVID_TOKEN}));

    var response = await dio
        .get('', queryParameters: {'state': initials, 'is_last': 'True'});

    print(response.data['results']);
    List<CovidModel> _data = [];

    for (var item in response.data['results']) {
      _data.add(CovidModel.fromJson(item));
    }

    return _data;
  }
}
