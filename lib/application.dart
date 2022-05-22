import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeatherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
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
      title: 'Kenlo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: KenloColors.white,
        textTheme: kenloTextTheme,
        primaryColor: KenloColors.primary,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: TokensColor.colorNeutral70),
          backgroundColor: KenloColors.white,
          actionsIconTheme: IconThemeData(color: KenloColors.primary),
          titleTextStyle: kenloTextTheme.subtitle1,
          toolbarTextStyle: TextStyle(color: KenloColors.primary),
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: kenloTextTheme.bodyText1,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: KenloColors.kenloRed,
          unselectedLabelColor: TokensColor.colorNeutral70,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: KenloColors.kenloRed,
                width: 2,
              ),
            ),
          ),
        ),
      ),
      initialRoute: isAuth ? Routes.main : Routes.login,
      getPages: KenloRouter.routes,
      navigatorObservers: [
        GetObserver((_) async {
          final String route = Get.currentRoute;
          try {
            final String rawRoute = route.replaceAll(RegExp('[?].*'), '');
            final GetPage? page = KenloRouter.routes.firstWhereOrNull((el) => el.name == rawRoute);
            if (page == null) return;
            await analytics.setCurrentScreen(page.title!);
          } catch (e) {
            Get.log('Error parsing route $route: $e', isError: true);
          }
        })
      ],
      locale: const Locale('pt', 'BR'), // use Get.deviceLocale when other languages are available
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
