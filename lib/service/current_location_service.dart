import 'package:dio/dio.dart';
import 'package:flutter_application_1/constant/constant.dart';
import 'package:flutter_application_1/model/current.dart';

class CurrentLocationService {
  Future<CurrentLocation> getCurrentLocation() async {
    final response = await Dio()
        .get('${Constant.url}current.json?key=${Constant.key}&q=Tamluk&aqi=no');

    return CurrentLocation.fromJson(response.data);
  }
}
