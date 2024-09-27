// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:crypto_quotient/controller/goal_scorer_provider.dart';

// import '../app_textfieldformfield.dart';
// import '../const.dart';

// class SearchGoalPopup extends StatefulWidget {
//   const SearchGoalPopup({super.key});

//   @override
//   State<SearchGoalPopup> createState() => _SearchGoalPopupState();
// }

// class _SearchGoalPopupState extends State<SearchGoalPopup> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<GoalScorerProvider>(builder: (context, data, child) {
//       return Container(
//         decoration: BoxDecoration(
//             color: lightBlackColor, borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               Column(
//                 children: [
//                   AppTextFormField(
//                     radius: 10,
//                     appController: data.dateController,

//                     maxLengthLine: 1,
//                     hintText: "Date eg: yyyy-mm-dd",
//                     // validator: (value) {
//                     //   if (value == "" || value!.isEmpty) {
//                     //     return "Date required";
//                     //   }
//                     //   return null;
//                     // },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   AppTextFormField(
//                     radius: 10,
//                     appController: data.homeController,
//                     maxLengthLine: 1,
//                     hintText: "Home Team",
//                     // validator: (value) {
//                     //   if (value == "" || value!.isEmpty) {
//                     //     return "Home team required";
//                     //   }
//                     //   return null;
//                     // },
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   AppTextFormField(
//                     radius: 10,
//                     appController: data.awayController,
//                     hintText: "Away Team",
//                     maxLengthLine: 1,
//                     // validator: (value) {
//                     //   if (value == "" || value!.isEmpty) {
//                     //     return "Away team required";
//                     //   }
//                     //   return null;
//                     // },
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: CustomButton(
//                     text: "Search",
//                     onPressed: () async {
//                       if (data.dateController.text == "" ||
//                           data.homeController.text == "" ||
//                           data.awayController.text == "") {
//                         return toast(context, msg: "Please fill the fields");
//                       }
//                       data.searchDate = data.dateController.text.trim();
//                       data.searchHome = data.homeController.text.trim();
//                       data.searchAway = data.awayController.text.trim();
//                       data.fetchGoalScores();
//                       data.dateController.clear();
//                       data.homeController.clear();
//                       data.awayController.clear();
//                       Navigator.pop(context);
//                     }),
//               )
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
