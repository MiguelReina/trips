import 'package:flutter/material.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:trips/User/ui/screens/signin_screen.dart';
import 'package:trips/services/push_notification_services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    PushNotificationService.messageStream.listen((message) {
      print('MyNotification: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: 'home',
        routes: {
          'home': (_) => const SignInScreen(),
        },
      ),
      bloc: BlocUser(),
    );
  }
}
