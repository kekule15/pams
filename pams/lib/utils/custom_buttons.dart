import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pams/utils/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget? title;
  final Function? onclick;

  const CustomButton({Key? key, this.title, this.onclick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        onclick!();
      },
      child: Container(
        height: 60.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: CustomColors.mainblueColor,
        ),
        child: Center(
          child: title!,
        ),
      ),
    );
  }
}