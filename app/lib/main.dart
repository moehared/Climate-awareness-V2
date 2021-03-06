import 'package:app/common/constant.dart';
import 'package:app/domain/services/local_db/hive/boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart';
import 'common/routes/app_routes.dart';
import 'domain/models/questionaire-model/questionaire.dart';
import 'domain/services/authentication_service/auth_service_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'domain/dialog_manager/dialog_manager.dart';
import 'domain/services/locator.dart';
import 'domain/services/navigation_service/navigation_service.dart';

import 'domain/models/Achievement-model.dart';

var questionaireMap = locator<Questionaire>();
String inputLocation = '';
var achievmentMap = <String, Achievement>{};
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ;
  final director = await getApplicationDocumentsDirectory();
  Hive.init(director.path);
  Hive.initFlutter();
  // Hive.registerAdapter(AchievementAdapter());
  // Hive.registerAdapter(AchievementTypesAdapter());

  // await Hive.openBox<Achievement>(ACHIEVEMENT_BOX);
  setUpLocatorService();
  // locator<Boxes<Achievement>>().openBox();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF512da8),
        primaryColorDark: const Color(0xff140078),
        primaryColorLight: const Color(0xff8559da),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xffc2185b),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.white),
          radius: const Radius.circular(32),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Roboto-Bold',
          ),
        ),
      ),
      builder: (ctx, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (ctx) => DiaglogManager(
            child: widget ?? Text("could not load dialog!"),
          ),
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      initialRoute: AuthServiceWrapper.routeName,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
