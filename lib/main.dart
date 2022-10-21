import 'package:flutter/material.dart';
import 'package:practice_clean_architecture/dependancy_injection.dart'
    as dependency_injection;
import 'package:practice_clean_architecture/userpreferances/user_preferances.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSharedPreferences.init();
  await dependency_injection.init();
  runApp(const MyApp());
}
