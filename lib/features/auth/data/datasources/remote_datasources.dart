import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<dynamic>> getTemperature() async {
    Response response = await dio.get(
        'https://bmkg-cuaca-api.vercel.app/cuaca?provinceId=lampung&districtId=501373');
    return response.data['data']['temperature']['data'];
  }

  Future<List<dynamic>> getWeather() async {
    Response response = await dio.get(
        'https://bmkg-cuaca-api.vercel.app/cuaca?provinceId=lampung&districtId=501373');
    return response.data['data']['max_temperature']['data'];
  }
}
