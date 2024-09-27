// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import '../models/coinlist_model.dart';

// class MatchesPopup extends StatefulWidget {
//   CoinList? data;
//   MatchesPopup({super.key, this.data});

//   @override
//   State<MatchesPopup> createState() => _MatchesPopupState();
// }

// class _MatchesPopupState extends State<MatchesPopup> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Text('Home Team: ',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//             Expanded(
//               child: Text(widget.data!.homeTeam.toString(),
//                   style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       overflow: TextOverflow.ellipsis)),
//             )
//           ],
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Text('Away Team: ',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//             Expanded(
//               child: Text(widget.data!.awayTeam.toString(),
//                   style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       overflow: TextOverflow.ellipsis)),
//             )
//           ],
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Text('Tournament: ',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//             Expanded(
//               child: Text(widget.data!.tournament.toString(),
//                   style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       overflow: TextOverflow.ellipsis)),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Text('Date: ',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//             Text(widget.data!.date.toString(),
//                 style:
//                     const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//           ],
//         )
//       ],
//     );
//   }
// }
