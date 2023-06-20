import 'package:flutter/material.dart';
import 'package:tabra3/features/presentation/view/recipient/screens/recipient_screen.dart';

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
    const RecipientScreen(),
    const TipsScreen(),
    const ProfileScreen(),
  ];
}
