import 'package:quick_lingo/core/helpers/injection_container.dart';
import 'package:quick_lingo/core/helpers/shared_preference_helper.dart';
import 'package:quick_lingo/features/app/main_page.dart';
import 'package:quick_lingo/features/app/splash_view.dart';
import 'package:quick_lingo/features/auth/presentation/sign_in/sign_in_page.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  GoRouter get router => _router;

  final _router = GoRouter(
    initialLocation: AppRoute.main,
    routes: [
      GoRoute(
        path: AppRoute.main,
        builder: (context, state) => const MainPage(),
        redirect: (context, state) {
          // TODO: - Redirect when not authorized

          if (getIt<SharedPreferenceHelper>().getFirstRun) {
            return AppRoute.signIn;
          } else {
            return null;
          }
        },
      ),
      GoRoute(
        path: AppRoute.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoute.signIn,
        builder: (context, state) => const SignInPage(),
      )
    ],
  );

  static const main = '/';
  static const splash = '/splash';
  static const signIn = '/auth/sign-in';
}
