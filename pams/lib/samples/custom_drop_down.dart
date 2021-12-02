import 'package:flutter/material.dart';
import 'package:pams/utils/custom_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatefulWidget {
  final String? title;
  final Widget? body;

  const CustomDropDown({
    Key? key,
    this.title,
    this.body,
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool _visibility = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _visibility = !_visibility;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: CustomColors.mainblueColor.withOpacity(0.8)),
                  ),
                  _visibility == false
                      ? Icon(
                          Icons.arrow_drop_down,
                          color: CustomColors.mainblueColor,
                          size: 28,
                        )
                      : Icon(
                          Icons.arrow_drop_up,
                          color: CustomColors.mainblueColor,
                          size: 28,
                        )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Visibility(
                  visible: _visibility,
                  child: Container(
                    child: widget.body,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
