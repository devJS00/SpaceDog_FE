import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

const _API_PREFIX = 'http://34.64.105.217:8080';

class LocationStream {
  Stream<Response<dynamic>> getCurrentLocation() async* {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? uid = user?.uid;

    final dio = Dio();
    yield* Stream.periodic(Duration(seconds: 3), (_) async {
      try {
        final response = await dio.get("$_API_PREFIX/soundLog/$uid");
        return response;
      } catch (e) {
        throw Exception("Failed to load data");
      }
    }).asyncMap((event) async => event);
  }
}

LocationStream locationStream = LocationStream();

// class LocationProvider with ChangeNotifier {
//   late int _lat;
//   late int _long;
//
//   List<int> getSound() {
//     _fetchLocation();
//     return [_lat, _long];
//   }
//
//   void _fetchLocation() async {
//     Response response;
//     Dio dio = new Dio();
//     response = await dio.get("$_API_PREFIX");
//     _lat = (response.data)['latitude'];
//     _long = (response.data)['longitude'];
//
//     notifyListeners(); // 데이터가 업데이트되었음을 리스너에게 알린다.
//   }
// }
//
// LocationProvider locationProvider = LocationProvider();
