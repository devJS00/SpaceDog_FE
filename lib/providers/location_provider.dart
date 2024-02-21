import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

const _API_PREFIX =
    'http://ec2-3-39-55-229.ap-northeast-2.compute.amazonaws.com/boards';

class LocationProvider with ChangeNotifier {
  late int _sound;

  int getSound() {
    _fetchSound();
    return _sound;
  }

  void _fetchSound() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("$_API_PREFIX");
    int result = (response.data)['result'];
    //print((response.data)['result']);

    _sound = result;
    notifyListeners(); // 데이터가 업데이트되었음을 리스너에게 알린다.
  }
}

LocationProvider locationProvider = LocationProvider();
