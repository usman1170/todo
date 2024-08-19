// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:todo/config/components/custom_button.dart';
import 'package:todo/config/components/snakbars.dart';
import 'package:todo/config/strings.dart';
import 'package:todo/main.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/theme_mode.dart';

class TaskUpdateScreen extends StatefulWidget {
  const TaskUpdateScreen({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<TaskUpdateScreen> createState() => _TaskUpdateScreenState();
}

class _TaskUpdateScreenState extends State<TaskUpdateScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
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
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              "Update Task",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            // backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 12),
                    child: Text(
                      MyString.titleOfTitleTextField,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _inputField(),
                  const SizedBox(
                    height: 8,
                  ),
                  _inputField(isDescription: true),
                  SizedBox(
                    height: mq.height * .05,
                  ),
                  _timePicker(),
                  SizedBox(
                    height: mq.height * .02,
                  ),
                  _datePicker(),
                  SizedBox(
                    height: mq.height * .04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          enableBorder: true,
                          borderColor: Colors.blue,
                          titleColor: context.isDarkMode
                              ? Colors.white
                              : Colors.blue.shade800,
                          height: 60,
                          width: mq.width * .4,
                          title: "Delete Task",
                          bgColor: context.isDarkMode
                              ? AppColors.primaryColor.withOpacity(.3)
                              : AppColors.white.withOpacity(.7),
                          onTap: () {
                            if (_title.text.isEmpty ||
                                _description.text.isEmpty) {
                              Snakbars.redSnackBar(
                                  context, "Please fill all the details");
                            } else {
                              Snakbars.greenSnackBar(context, "Task Deleted");
                            }
                          },
                        ),
                        // add or update
                        CustomButton(
                          enableBorder: true,
                          borderColor: Colors.white,
                          titleColor: Colors.white,
                          height: 60,
                          width: mq.width * .4,
                          title: "Update Task",
                          bgColor: context.isDarkMode
                              ? AppColors.primaryColor.withOpacity(.3)
                              : Colors.blue.shade900.withOpacity(.7),
                          onTap: () {
                            if (_title.text.isEmpty ||
                                _description.text.isEmpty) {
                              Snakbars.redSnackBar(
                                  context, "Please fill all the details");
                            } else {
                              Snakbars.greenSnackBar(context, "Task Updated");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _timePicker() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 270,
              child: TimePickerWidget(
                onChange: (_, __) {},
                dateFormat: "HH:mm",
                onConfirm: (dateTime, _) {},
              ),
            );
          },
        );
      },
      child: Container(
        height: mq.height * .08,
        width: mq.width,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.primaryColor.withOpacity(.3)
              : AppColors.white.withOpacity(.7),
          border: Border.all(
            color: context.isDarkMode
                ? Colors.blue.shade900
                : Colors.grey.shade600,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Time",
              style: TextStyle(
                fontSize: 15,
                color: context.isDarkMode ? Colors.white : Colors.grey.shade900,
              ),
            ),
            Text(
              "Select Time",
              style: TextStyle(
                fontSize: 15,
                color:
                    context.isDarkMode ? Colors.white : AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _datePicker() {
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(
          context,
          maxDateTime: DateTime(2030, 12, 12),
          minDateTime: DateTime.now(),
          onConfirm: (dateTime, _) {},
        );
      },
      child: Container(
        height: mq.height * .08,
        width: mq.width,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.primaryColor.withOpacity(.3)
              : AppColors.white.withOpacity(.7),
          border: Border.all(
            color: context.isDarkMode
                ? Colors.blue.shade900
                : Colors.grey.shade700,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Date",
              style: TextStyle(
                fontSize: 15,
                color: context.isDarkMode ? Colors.white : Colors.grey.shade900,
              ),
            ),
            Text(
              "Select Date",
              style: TextStyle(
                fontSize: 15,
                color:
                    context.isDarkMode ? Colors.white : AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({bool isDescription = false}) {
    if (isDescription) {
      _description.text = widget.taskModel.subtitle;
    } else {
      _title.text = widget.taskModel.title;
    }
    return TextFormField(
      controller: isDescription ? _description : _title,
      enableSuggestions: true,
      autocorrect: true,
      style: const TextStyle(color: Colors.white),
      onFieldSubmitted: (value) {},
      onChanged: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter The Details";
        } else {
          return null;
        }
      },
      cursorColor: Colors.white,
      // initialValue:
      //     isDescription ? widget.taskModel.subtitle : widget.taskModel.title,
      decoration: InputDecoration(
        hintText: isDescription ? "Enter description" : "Enter title",
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: .4,
          color: Colors.white,
        ),
        prefixIcon: isDescription
            ? const Icon(
                Icons.description_outlined,
                color: Colors.white,
              )
            : const Icon(
                Icons.bookmark_outline,
                color: Colors.white,
              ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
