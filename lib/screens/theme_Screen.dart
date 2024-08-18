import 'package:flutter/material.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/theme_mode.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: context.isDarkMode
              ? [
                  Colors.black87,
                  Colors.black87,
                ]
              : AppColors.blueGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Theme Screen"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
