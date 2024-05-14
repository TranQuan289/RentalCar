import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rental_car/application/di/injection.dart';
import 'package:rental_car/application/utils/colors_utils.dart';
import 'package:rental_car/data/data_sources/remote/api/firebase_api.dart';
import 'firebase_options.dart';

import 'application/routes/routes.dart';
import 'application/routes/routes_name.dart';
import 'application/routes/routes_test.dart';

Injection injection = Injection();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injection.configDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Rental Car',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorUtils.whiteColor,
          ),
          fontFamily: 'OpenSans',
          useMaterial3: true,
        ),
        initialRoute: RoutesName.auth,
        onGenerateRoute: Routes.routeBuilder,
        routes: RoutesTest.routes(),
      ),
    );
  }
}
