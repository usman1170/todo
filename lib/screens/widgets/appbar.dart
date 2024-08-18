import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo/config/helpers.dart';
import 'package:todo/main.dart';
import 'package:todo/provider/time_provider.dart';
import 'package:todo/theme/app_colors.dart';

class AppBar2 extends StatelessWidget {
  const AppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    final timeProvider = Provider.of<TimeProvider>(context);
    // log("appbar rebuild");
    mq = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: mq.height * .15,
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mq.height * .013,
                  ),
                  Text(
                    MyDateUtils.getDateWithMonthName(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.lightColor,
                    ),
                  ),
                  Text(
                    MyDateUtils.getDayName(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightColor,
                    ),
                  ),
                  Text(
                    MyDateUtils.getFormattedTime(timeProvider.currentTime),
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.lightColor),
                  ),
                ],
              ),
              SizedBox(
                width: mq.width * .04,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mq.height * .012,
                      ),
                      SizedBox(
                        height: 55,
                        width: 100,
                        child: Center(
                          child: AnimatedRadialGauge(
                            duration: const Duration(seconds: 2),
                            curve: Curves.elasticOut,
                            radius: 100,
                            value: 3,
                            initialValue: 10,
                            axis: GaugeAxis(
                              min: 0,
                              max: 10,
                              degrees: 180,
                              style: const GaugeAxisStyle(
                                thickness: 20,
                                background: Color.fromARGB(255, 209, 217, 242),
                                segmentSpacing: 4,
                              ),
                              pointer: GaugePointer.needle(
                                borderRadius: 16,
                                color: const Color.fromARGB(255, 8, 198, 15),
                                width: 12,
                                height: mq.height * .03,
                              ),
                              progressBar: const GaugeProgressBar.rounded(
                                color: Color.fromARGB(255, 8, 198, 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "3 of 10 Task",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
