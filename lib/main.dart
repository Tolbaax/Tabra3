import 'package:flutter/material.dart';

import 'app.dart';
import 'core/services/injection_container.dart' as di;

void main() async {
  // make sure that everything in methode is finished, then open the app
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}
