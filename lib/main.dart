import 'package:flutter/material.dart';
import 'core/core.dart';
import 'package:provider/provider.dart';

import 'core/dependencies.dart' show providers;

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              color: AppColors.redPinkMain,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          fontFamily: "Poppins",
          colorScheme: AppColors.lightColorScheme,
        ),
        routerConfig: router,
      ),
    );
  }
}
