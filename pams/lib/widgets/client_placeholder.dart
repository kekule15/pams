// import 'package:flutter/material.dart';

// class ClientPlaceholder extends StatelessWidget {
//   String title;
//   String amount;
//   String img_url;
//   String subtitle;
//   String quantity;

//   ClientPlaceholder(
//       {
//       required  this.title, 
//       required  this.amount, 
//       required  this.img_url, 
//       required  this.subtitle, 
//       required  this.quantity});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         baseColor: Colors.grey[300],
//         highlightColor: Colors.white,
//         child: Container(
//           margin: EdgeInsets.symmetric(
//               // horizontal: CustomDimensions.defaultMargin,
//               // vertical: CustomDimensions.smallSpacing,
//               ),
//           child: Stack(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: 60.0,
//                         width: 60.0,
//                         decoration: BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: const BorderRadius.all(
//                               const Radius.circular(5.0)),
//                           shape: BoxShape.rectangle,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10.0,
//                       ),
//                       Expanded(
//                         child: Container(
//                           margin: EdgeInsets.only(
//                             left: 30,
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "$title",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyText1!
//                                     .copyWith(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 15.0,
//                                     ),
//                               ),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: <Widget>[
//                                   Text(
//                                     '\u{20A6}',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText1!
//                                         .copyWith(
//                                             fontSize: 16.0,
//                                             fontFamily: '',
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "$amount",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText1!
//                                         .copyWith(
//                                             fontSize: 16.0,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10.0,
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Container(
//                             height: 30.0,
//                             width: 30.0,
//                             decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: Text(''),
//                           ),
//                           SizedBox(
//                             width: 7.0,
//                           ),
//                           Text(quantity),
//                           SizedBox(
//                             width: 7.0,
//                           ),
//                           InkWell(
//                             child: Container(
//                               height: 30.0,
//                               width: 30.0,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               child: Icon(
//                                 Icons.add,
//                                 color: Colors.black,
//                                 size: 25.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
