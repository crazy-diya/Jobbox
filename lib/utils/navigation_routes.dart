import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:technical_assesment/features/presentation/views/dashboard_view/dashboard_screen.dart';
import 'package:technical_assesment/features/presentation/views/dashboard_view/job_listing_view/recent_jobs_bean.dart';
import 'package:technical_assesment/features/presentation/views/sign_in_view/sign_in_screen.dart';
import 'package:technical_assesment/features/presentation/views/spalsh_view/splash_screen.dart';

import '../features/presentation/views/apply_view/employment_information_screen.dart';
import '../features/presentation/views/apply_view/review_information_screen.dart';
import '../features/presentation/views/apply_view/upload_documnet_screen.dart';
import '../features/presentation/views/sign_up_view/sign_up_screen.dart';

class Routes {
  static const String kSplashView = "kSplashView";
  static const String kSignInView = "kSignInView";
  static const String kDashBoardView = "kDashBoardView";
  static const String kSignUpScreen = "kSignUpScreen";
  static const String kUploadDocumentScreen = "kUploadDocumentScreen";
  static const String kReviewInformationScreen = "kReviewInformationScreen";
  static const String kEmploymentInformationScreen = "kEmploymentInformationScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kSplashView:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kSplashView),
        );
      case Routes.kSignInView:
        return PageTransition(
          child: const SignInScreen(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kSignInView),
        );
      case Routes.kSignUpScreen:
        return PageTransition(
          child: const SignUpScreen(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kSignInView),
        );
      case Routes.kDashBoardView:
        return PageTransition(
          child: const DashBoardScreen(),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kDashBoardView),
        );
      case Routes.kUploadDocumentScreen:
        return PageTransition(
          child: UploadDocumentScreen(job: settings.arguments as RecentJobsBean),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kUploadDocumentScreen),
        );
        ;
      case Routes.kReviewInformationScreen:
        return PageTransition(
          child: ReviewInformationScreen(job: settings.arguments as RecentJobsBean),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kReviewInformationScreen),
        );
      case Routes.kEmploymentInformationScreen:
        return PageTransition(
          child: EmploymentInformationScreen(job: settings.arguments as RecentJobsBean),
          type: PageTransitionType.fade,
          settings: const RouteSettings(name: Routes.kEmploymentInformationScreen),
        );
      default:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}
