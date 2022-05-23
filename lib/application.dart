import 'package:cloudwalk_weather/intl/app_translation.dart';
import 'package:cloudwalk_weather/router/router.dart';
import 'package:cloudwalk_weather/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 800,
        minWidth: 400,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(400, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
        ],
      ),
      title: 'Cloudwalk Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.main,
      getPages: AppRouter.routes,
      navigatorObservers: [
        GetObserver((_) async {
          final String route = Get.currentRoute;
          try {
            final String rawRoute = route.replaceAll(RegExp('[?].*'), '');
            final GetPage? page =
                AppRouter.routes.firstWhereOrNull((el) => el.name == rawRoute);
            if (page == null) return;
          } catch (e) {
            Get.log('Error parsing route $route: $e', isError: true);
          }
        })
      ],
      locale: const Locale('pt',
          'BR'), // here you can use Get.deviceLocale when other languages are available
      fallbackLocale: const Locale('pt', 'BR'),
      translationsKeys: AppTranslation.translationsKeys,
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }
}
