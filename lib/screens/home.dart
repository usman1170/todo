import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/config/strings.dart';
import 'package:todo/main.dart';
import 'package:todo/screens/widgets/appbar.dart';
import 'package:todo/screens/widgets/task_widget.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/theme_mode.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> testList = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    // log("home rebuild");
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: context.isDarkMode
                ? [Colors.black, Colors.black]
                : [
                    Colors.blue.shade500,
                    Colors.blue.shade600,
                    Colors.blue.shade900,
                  ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: mq.width * .08,
              ),
              const AppBar2(),
              Expanded(
                child: testList.isNotEmpty
                    ? ListView.builder(
                        itemCount: testList.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            direction: DismissDirection.horizontal,
                            onDismissed: (direction) {
                              testList.removeAt(index);
                              setState(() {});
                              log(testList.length.toString());
                            },
                            background: const Row(
                              children: [
                                SizedBox(
                                  width: 6,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: AppColors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  MyString.deleteTask,
                                  style: TextStyle(color: AppColors.grey),
                                )
                              ],
                            ),
                            key: Key(
                              index.toString(),
                            ),
                            child: const TaskCardWidget(),
                          );
                        },
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: mq.height * .32,
                            width: mq.width,
                            child: Lottie.asset(
                              "assets/lottie/1.json",
                              animate: testList.isNotEmpty ? false : true,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            MyString.doneAllTask,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: mq.height * .12,
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8, right: 4),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
