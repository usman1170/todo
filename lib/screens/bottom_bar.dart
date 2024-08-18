import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/add_task.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/theme_Screen.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/bloc/theme_cubit.dart';
import 'package:todo/theme/theme_mode.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 1;
  final screens = [
    AddTaskScreen(
      backButtom: false,
    ),
    const HomeScreen(),
    const ThemeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: context.isDarkMode
                    ? [
                        Colors.black,
                        Colors.black,
                      ]
                    : [
                        Colors.blue.shade800,
                        Colors.blue.shade900,
                      ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 60,
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? AppColors.primaryColor.withOpacity(.4)
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: context.isDarkMode
                              ? Colors.white
                              : AppColors.primaryColor,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: context.isDarkMode
                                ? Colors.white
                                : AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(width: 60),
                  InkWell(
                    onTap: () {
                      if (context.isDarkMode) {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                        log("Theme Changes");
                      } else {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                        log("Theme Changes");
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.brightness_6,
                          color: context.isDarkMode
                              ? Colors.white
                              : AppColors.primaryColor,
                        ),
                        Text(
                          "Theme",
                          style: TextStyle(
                            color: context.isDarkMode
                                ? Colors.white
                                : AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.brightness_4_outlined,
                  //     color: context.isDarkMode
                  //         ? Colors.white
                  //         : AppColors.primaryColor,
                  //   ),
                  //   onPressed: () {
                  //     if (context.isDarkMode) {
                  //       context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                  //       log("Theme Changes");
                  //     } else {
                  //       context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                  //       log("Theme Changes");
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -20,
            child: FloatingActionButton(
              backgroundColor: context.isDarkMode
                  ? const Color.fromARGB(255, 93, 57, 171).withOpacity(.85)
                  : Colors.blue.shade600,
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
