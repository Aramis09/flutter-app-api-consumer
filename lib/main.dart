import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/client/features/home/presentation/bloc/advertising_bloc.dart';
import 'package:flutter_aplication_bloc/client/features/theme/production/cubit/theme_cubit.dart';
import 'package:flutter_aplication_bloc/settings/router/sheell_router_home_screen.dart';
import 'package:flutter_aplication_bloc/settings/themes/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/features/login/bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AdvertisingBloc()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LoginBloc()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) => SafeArea(
            child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'App',
            theme: AppTheme()
                .theme(themeState.colorSelected, themeState.colorList),
            routerConfig: appRouter,
          ),
        )),
      ),
    );
  }
}
// Builder(
//         builder: (context) => BlocBuilder<ThemeCubit, ThemeState>(
//           builder: (context, themeState) => MaterialApp(
//             title: 'Flutter puto',
//             theme: AppTheme().theme(themeState.colorSelected),
//             home: const AdvertisingScreen(),
//           ),
//         ),
//       ),


    //   child: BlocBuilder<ThemeCubit, ThemeState>(
    //     builder: (context, themeState) => MaterialApp(
    //       title: 'Flutter puto',
    //       theme: AppTheme().theme(themeState.colorSelected),
    //       home: const AdvertisingScreen(),
    //     ),
    //   ),
    // );
