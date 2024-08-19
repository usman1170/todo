import 'package:flutter/material.dart';
import 'package:todo/config/helpers.dart';
import 'package:todo/main.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/theme_mode.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.taskModel,
    required this.ontap,
  });
  final TaskModel taskModel;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
            color: context.isDarkMode
                ? AppColors.primaryColor.withOpacity(.3)
                : AppColors.white.withOpacity(.7),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                offset: const Offset(0, 4),
                blurRadius: 10,
              )
            ]),
        duration: const Duration(microseconds: 500),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: taskModel.isCompleted
                      ? AppColors.primaryColor
                      : Colors.red.shade400,
                ),
                color: taskModel.isCompleted
                    ? AppColors.primaryColor
                    : Colors.red.shade400,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  taskModel.isCompleted
                      ? Icons.check
                      : Icons.timelapse_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          title: Text(
            taskModel.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModel.subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                  // decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Date : ${MyDateUtils.getDashedDate(taskModel.createdDate)} at ${MyDateUtils.getTimeWithoutSeconds(taskModel.createdTime)}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          trailing: Container(
            height: 25,
            width: mq.width * .25,
            decoration: BoxDecoration(
              color: taskModel.isCompleted ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                taskModel.isCompleted ? "Completed" : "Pending",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
