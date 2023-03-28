import 'package:flutter/material.dart';
import 'package:tabra3/core/utils/app_strings.dart';
import 'package:tabra3/features/blood_patient/blood_patient.dart';
import 'package:tabra3/features/donors/screens/donors_screen.dart';
import 'package:tabra3/features/home/screens/home_screen.dart';
import 'package:tabra3/features/profile/screens/profile_screen.dart';
import 'package:tabra3/features/tips/tips.dart';


class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const DonorsScreen(),
    const BloodPatientScreen(),
    const TipsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: AppStrings.donors,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bloodtype_outlined),
            label: 'مرضي الدم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tips_and_updates),
            label: AppStrings.tips,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
      body: screens[selectedIndex],
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
