import 'package:firebase_auth/firebase_auth.dart';
import 'package:dio/dio.dart';

const _API_PREFIX = 'http://34.64.105.217:8080';

class SoundStream {
  Stream<Response<dynamic>> getCurrentSound() async* {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? uid = user?.uid;

    final dio = Dio();
    yield* Stream.periodic(Duration(seconds: 3), (_) async {
      try {
        final response = await dio.get("$_API_PREFIX/soundLog/$uid");
        //print(response.data);
        return response;
      } catch (e) {
        throw Exception("Failed to load data");
      }
    }).asyncMap((event) async => event);
  }
}

SoundStream soundStream = SoundStream();
