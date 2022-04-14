import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/ui/theme.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const MyInputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      cursorColor:
                          Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                      controller: controller,
                      style: subTitleStyle,
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: subTitleStyle,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).backgroundColor,
                              width: 0),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
