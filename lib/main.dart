import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/services/injection_container.dart' as di;
import 'core/shared/bloc_observer.dart';

void main() async {
  // make sure that everything in methode is finished, then open the app
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  await di.init();

  runApp(const MyApp());
}
