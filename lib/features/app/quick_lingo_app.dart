import 'package:quick_lingo/core/helpers/injection_container.dart';
import 'package:quick_lingo/core/routing/app_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class QuickLingoApp extends StatefulWidget {
  const QuickLingoApp({super.key});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_QuickLingoAppState>()?.restartApp();
  }

  static void setLocale(BuildContext context, Locale newLocale) async {
    _QuickLingoAppState? state =
        context.findAncestorStateOfType<_QuickLingoAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<QuickLingoApp> createState() => _QuickLingoAppState();
}

class _QuickLingoAppState extends State<QuickLingoApp> {
  Key key = UniqueKey();
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  void setLocale(Locale value) async {
    await context.setLocale(value);
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        routerConfig: getIt<AppRoute>().router,
      ),
    );
  }
}
