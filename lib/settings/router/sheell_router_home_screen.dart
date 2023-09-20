import 'package:flutter_aplication_bloc/client/features/home/presentation/views/advertising_detail.dart';
import 'package:flutter_aplication_bloc/client/features/home/presentation/views/advertising_view.dart';
import 'package:flutter_aplication_bloc/client/features/settings/presentation/views/settings_view.dart';
import 'package:flutter_aplication_bloc/client/features/settings/presentation/views/theme_options_view.dart';
import 'package:flutter_aplication_bloc/client/features/shared/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../common/features/login/presentation/screens/login_app_screen.dart';
import '../../common/features/login/presentation/screens/sign_in_screen.dart';

final appRouter = GoRouter(initialLocation: "/login", routes: [
  ShellRoute(
      builder: (context, state, child) => HomeScreen(childrenView: child),
      routes: [
        GoRoute(
            path: "/",
            builder: (context, state) => const AdvertisingView(),
            routes: [
              GoRoute(
                path: "advertisingDetail/:id",
                builder: (context, state) =>
                    AdvertisingDetailWidget(params: state.pathParameters),
              )
            ]),
        GoRoute(
          path: "/settings",
          builder: (context, state) => const SettingsView(),
          routes: [
            GoRoute(
              path: "themeOptions",
              builder: (context, state) => const ThemesOptionsView(),
            ),
          ],
        ),
      ]),
  GoRoute(
    path: "/login",
    builder: (context, state) => const LoginAppScreen(),
  ),
  GoRoute(
    path: "/singUp",
    builder: (context, state) => const SignInScreen(),
  )
]);
