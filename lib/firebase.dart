import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging fcm;

void initFcm() {
  if (fcm == null) {
    fcm = FirebaseMessaging();
  }

  fcm.getToken().then((token) {
    print("\n******\nFirebase Token $token\n******\n");
  });

  fcm.subscribeToTopic("all");

  fcm.configure(
    onMessage: (Map<String, dynamic> message) async {
      print('\n\n\n*** on message $message');

      String nome = message['data']['nome'];
      print("onMessage: $nome");
    },
    onResume: (Map<String, dynamic> message) async {
      print('\n\n\n*** on resume $message');

      String nome = message['data']['nome'];
      print("onResume: $nome");
    },
    onLaunch: (Map<String, dynamic> message) async {
      print('\n\n\n*** on launch $message');

      String nome = message['data']['nome'];
      print("onLaunch: $nome");
    },
  );

  if (Platform.isIOS) {
    fcm.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    fcm.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("iOS Push Settings: [$settings]");
    });
  }
}