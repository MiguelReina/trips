import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStreamController =
      new StreamController.broadcast();
  static Stream<String> get messageStream => _messageStreamController.stream;
  static Future _backgroundHandler(RemoteMessage message) async {
    print('Background Handler ${message.messageId}');
    print(message.data);
    print(message.data[0]);
    _messageStreamController
        .add(message.notification?.body ?? 'No tiene titulo');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('On Message Handler ${message.messageId}');
    print(message.data);
    print(message.data.values);
    _messageStreamController
        .add(message.notification?.body ?? 'No tiene titulo');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('On Message Open App Handler ${message.messageId}');
    print(message.data);
    print(message.data[0]);
    _messageStreamController
        .add(message.notification?.body ?? 'No tiene titulo');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
