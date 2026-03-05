import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SBO App',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'InterDisplay',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          surface: AppColors.lightBackground,
          onSurface: AppColors.darkBackground,
        ),
        scaffoldBackgroundColor: AppColors.lightBackground,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.darkBackground),
          bodyMedium: TextStyle(color: AppColors.darkBackground),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.darkBackground.withOpacity(0.3)),
          prefixIconColor: AppColors.darkBackground,
          suffixIconColor: AppColors.darkBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.lightBackground,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'InterDisplay',
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          surface: AppColors.darkBackground,
          onSurface: AppColors.lightBackground,
        ),
        scaffoldBackgroundColor: AppColors.darkBackground,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.lightBackground),
          bodyMedium: TextStyle(color: AppColors.lightBackground),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: AppColors.lightBackground.withOpacity(0.3)),
          prefixIconColor: AppColors.lightBackground,
          suffixIconColor: AppColors.lightBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkBackground,
          foregroundColor: AppColors.lightBackground,
          elevation: 0,
        ),
      ),
      themeMode: ThemeMode.system, 
      home: const SplashScreen(),
    );
  }
}
