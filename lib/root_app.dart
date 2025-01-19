import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/themes/app_themes.dart';
import 'package:portfolio/core/utils/app_strings.dart';
import 'package:portfolio/cubit/landing_cubit.dart';
import 'package:portfolio/features/main_navigation/landing_view.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 944),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => BlocProvider<LandingCubit>(
        create: (_) => LandingCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          theme: AppThemes.dark,
          themeMode: ThemeMode.dark,
          home: const LandingView(),
        ),
      ),
    );
  }
}
