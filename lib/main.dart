import 'package:flutter/material.dart';
import 'core/core.dart';
import 'package:provider/provider.dart';

import 'core/dependencies.dart' show providers;

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MultiProvider(
      providers: providers,
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(colorScheme: AppColors.lightColorScheme),
        routerConfig: router(),
      ),
    );
  }
}
