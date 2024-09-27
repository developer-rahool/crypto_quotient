// import 'package:flutter/material.dart';

// import '../const.dart';

// class CustomAlert extends StatefulWidget {
//   final Widget? dialogueWidget;
//   final void Function()? onPressed;
//   const CustomAlert({
//     Key? key,
//     this.dialogueWidget,
//     this.onPressed,
//   }) : super(key: key);

//   @override
//   _CustomAlertState createState() => _CustomAlertState();
// }

// class _CustomAlertState extends State<CustomAlert> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       surfaceTintColor: Colors.white,
//       scrollable: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       content: contentBox(context),
//     );

//     //   Dialog(

//     //     shape: RoundedRectangleBorder(
//     //       borderRadius: BorderRadius.circular(customAlertPadding),
//     //     ),
//     //     elevation: 0,
//     //     backgroundColor: Colors.transparent,
//     //     child: contentBox(context),
//     //   );
//   }

//   contentBox(context) {
//     return Stack(
//       fit: StackFit.passthrough,
//       children: <Widget>[
//         Container(
//           // padding: const EdgeInsets.only(
//           //     left: customAlertPadding,
//           //     top: customAlertLogoRadius + customAlertPadding,
//           //     right: customAlertPadding,
//           //     bottom: customAlertPadding),
//           //margin: const EdgeInsets.only(top: customAlertLogoRadius),
//           decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: const [
//                 BoxShadow(
//                     color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
//               ]),
//           child: widget.dialogueWidget,
//         ),
//         // Positioned(
//         //   left: customAlertPadding,
//         //   right: customAlertPadding,
//         //   child: CircleAvatar(
//         //     backgroundColor: Colors.transparent,
//         //     radius: customAlertLogoRadius,
//         //     child: ClipRRect(
//         //         borderRadius: const BorderRadius.all(
//         //             Radius.circular(customAlertLogoRadius)),
//         //         child: Image.asset("assets/images/app-logo.png")),
//         //   ),
//         // ),
//         Positioned(
//           right: 10,
//           top: 10,
//           child: InkWell(
//             // splashColor:
//             //     Colors.red, // Splash color
//             onTap: widget.onPressed ??
//                 () {
//                   Navigator.pop(context);
//                 },
//             child: Icon(
//               Icons.close,
//               color: midBlackColor,
//               size: screenHeight(context) * 0.0315,
//               // size: 10,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
