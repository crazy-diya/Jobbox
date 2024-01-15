import 'package:flutter/material.dart';
import 'package:technical_assesment/features/presentation/views/dashboard_view/profile_view/profile_screen.dart';

import 'applied_jobs_view/applied_jobs_screen.dart';
import 'bottom_navbar.dart';
import 'job_listing_view/job_listing_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedTab = 1;
  List<int> tabHistory = [1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedTab: selectedTab,
        callback: (value) {
          changeTab(value);
        },
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    switch (selectedTab) {
      case 1:
        return const JobListingsScreen();
      case 2:
        return const AppliedJobScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const JobListingsScreen();
    }
  }

  void changeTab(int value) {
    setState(() {
      if (selectedTab != value) {
        selectedTab = value;
        tabHistory.add(value);
      }
      if (selectedTab == 1) {}
    });
  }
}
