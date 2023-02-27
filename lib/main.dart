import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'FlightUI/common/global.dart';
import 'FlightUI/common/pages.dart';
import 'FlightUI/common/routes.dart';
import 'FlightUI/flight_ui/screens/splash_screen.dart';
import 'Tickets/common/global.dart';
import 'Tickets/common/routes.dart';
import 'Tickets/tickets_modules/view.dart';
import 'firebase_options.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //TicketsGlobal.initialize();
  Global.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      defaultTransition: Transition.rightToLeft,
      getPages: AppPages.pages,
      home: const SplashScreen(),
      //home: TicketsScreen(),
    );
  }
}

