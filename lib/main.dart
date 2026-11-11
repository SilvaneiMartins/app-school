import 'package:flutter/material.dart';
import "package:school/core/app_theme.dart";
import "package:school/splash/splash_screen.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

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