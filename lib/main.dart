import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:school/core/app_theme.dart";
import "features/splash/splash_screen.dart";

void main() {
  runApp(
    ProviderScope(
        child: MaterialApp(
        title: 'School',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeData(),
        darkTheme: AppTheme.darkThemeData(),
        home: const SplashScreen(),
      ),
    )  
  );
}