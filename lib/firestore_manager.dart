import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, dynamic>> getUserData(
    FirebaseFirestore db, FirebaseAuth auth) async {
  User? user = auth.currentUser;
  String? uid;
  if (user != null) {
    uid = user.uid;
  } else {
    print('User does not exist');
    return {}; // 빈 Map을 반환
  }

  final doc = await db.collection("users").doc(uid).get();

  if (doc.exists) {
    final data = doc.data() as Map<String, dynamic>;
    return data;
  } else {
    print('Document does not exist');
    return {}; // 빈 Map을 반환
  }
}
