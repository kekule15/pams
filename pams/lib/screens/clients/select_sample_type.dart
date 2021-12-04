// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pams/utils/custom_buttons.dart';
// import 'package:pams/utils/custom_colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SelectSampleType extends StatefulWidget {
//   const SelectSampleType({Key? key}) : super(key: key);

//   @override
//   _SelectSampleTypeState createState() => _SelectSampleTypeState();
// }

// class _SelectSampleTypeState extends State<SelectSampleType> {
//   bool _selected = false;
//   int? selected;
//   List<String> logoImg = [
//     'assets/img/uk.svg',
//     'assets/img/french.svg',
//     'assets/img/spanish.svg',
//     'assets/img/russian.svg',
//     'assets/img/Portugal.svg'
//   ];
//   List<String> title = [
//     'English',
//     'French',
//     'Spanish',
//     'Portuguese',
//     'Russian'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.background,
//       body: Container(
//         margin: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
//         child: ListView(
//           children: [
//             Text(
//               'Choose prefered\n\Language',
//               style: TextStyle(
//                   color: CustomColors.mainblueColor,
//                   fontSize: 25.sp,
//                   fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Text(
//               'Choose Language, this app is only available \n\in selected countries. Select yours',
//               style: TextStyle(
//                 fontSize: 15.sp,
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 itemCount: logoImg.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             selected = index;
//                             _selected = !_selected;
//                           });
//                         },
//                         child:
//                             _contryList(index, logoImg[index], title[index])),
//                   );
//                 }),
//             SizedBox(
//               height: 20.h,
//             ),
//             CustomButton(
//               onclick: () {},
//               title: Text(
//                 'Continue',
//                 style: TextStyle(
//                     color: CustomColors.background,
//                     fontSize: 17.sp,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _contryList(int index, String logo, String title) {
//     return Container(
//       height: 60,
//       //margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.h),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.r),
//           border: selected == index
//               ? Border.all(color: CustomColors.mainblueColor, width: 1)
//               : Border.all(color: Colors.grey, width: 1)),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SvgPicture.asset(logo),
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 Text(
//                   title,
//                   style: TextStyle(
//                       color: CustomColors.mainblueColor.withOpacity(0.8)),
//                 )
//               ],
//             ),
//             selected == index
//                 ? CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     radius: 14.r,
//                     child: Icon(
//                       Icons.done,
//                       color: CustomColors.background,
//                       size: 15.w,
//                     ),
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
