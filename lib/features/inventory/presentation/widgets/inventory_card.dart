// import 'package:final_assignment/features/inventory/data/model/confirm_booking_api_model.dart';
// import 'package:flutter/material.dart';

// class InventoryCard extends StatelessWidget {
//   const InventoryCard({
//     super.key,
//     required this.bike,
//   });

//   final ConfirmBookingApiModel bike;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 88,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF5F6F9),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Text(bike.bikeNumber),
//             ),
//           ),
//         ),
//         const SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               bike.bikeNumber,
//               style: const TextStyle(color: Colors.black, fontSize: 16),
//               maxLines: 2,
//             ),
//             const SizedBox(height: 8),
//             Text.rich(
//               TextSpan(
//                 text: "\$${bike.total}",
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w600, color: Colors.amber),
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
