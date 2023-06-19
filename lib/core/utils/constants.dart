import 'package:flutter/material.dart';

import '../../features/presentation/view/blood_patient/blood_patient.dart';
import '../../features/presentation/view/donors/screens/donors_screen.dart';
import '../../features/presentation/view/home/screens/home_screen.dart';
import '../../features/presentation/view/profile/screens/profile_screen.dart';
import '../../features/presentation/view/tips/tips.dart';
import 'assets_manager.dart';

class Constants {
  List<String> images = [
    ImageAssets.donation1,
    ImageAssets.donation2,
    ImageAssets.donation3,
    ImageAssets.donation4,
  ];

  List<String> bloods = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O-',
    'O+',
    'AB+',
    'AB-',
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const DonorsScreen(),
    const BloodPatientScreen(),
    const TipsScreen(),
    const ProfileScreen(),
  ];
}
