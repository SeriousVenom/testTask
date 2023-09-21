import 'package:dio/dio.dart';
import 'package:test_task/repositories/models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel> getWeather(String cityName) async {
    Dio dio = Dio();
    String tokenKey = '13b7bda79e6b4a2f94250810232109';
    final response = await dio.get(
        'http://api.weatherapi.com/v1/current.json?key=$tokenKey&q=$cityName&aqi=no');
    final data = response.data as Map<String, dynamic>;
    final weather = WeatherModel.fromJson(data);
    return weather;
  }
}
