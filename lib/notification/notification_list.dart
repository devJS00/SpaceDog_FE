import 'package:flutter/material.dart';

class NotificationList with ChangeNotifier {
  List<List<String>> notificationList = [
    ["2020-2-5 4:03", "Your dog is barking"],
    ["2020-2-5 6:03", "Your dog is barking"]
  ];

  AddNotification(List<String> noti) {
    notificationList.add(noti);
    notifyListeners();
  }
}
