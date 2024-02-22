import 'package:flutter/material.dart';

class NotificationList with ChangeNotifier {
  List<List<String>> notificationList = [
    ["2024-2-5 5:10", "Your dog is barking"],
    ["2024-2-5 4:03", "Your dog is barking"],
    ["2024-2-5 3:30", "Your dog is barking"],
    ["2024-2-5 3:03", "Your dog is barking"],
  ];

  AddNotification(List<String> noti) {
    notificationList.add(noti);
    notifyListeners();
  }
}
