import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technical_assesment/utils/app_colors.dart';
import 'package:technical_assesment/utils/navigation_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: Routes.kSplashView,
          onGenerateRoute: Routes.generateRoute,
          color: AppColors.fontColorDarkBrown,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.openSansTextTheme(),
            scaffoldBackgroundColor: AppColors.colorBackground,
            primaryColor: AppColors.colorPrimary,
          ),
        );
      },
    );
  }
}
