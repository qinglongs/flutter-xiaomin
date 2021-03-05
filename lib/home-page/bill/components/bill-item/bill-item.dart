import 'package:flutter/material.dart';

// class BillItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: Container(
//         padding: EdgeInsets.all(15),
//         height: 120,
//         color: Colors.pink[100],
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ClipOval(
//               child: Container(
//                 width: 90,
//                 height: 90,
//                 color: Colors.white70,
//                 child: Center(
//                   child: Icon(
//                     Icons.local_mall,
//                     size: 50,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 20),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Container(
//                 height: 90,
//                 width: 250,
//                 padding: EdgeInsets.all(10),
//                 color: Colors.white70,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Text(
//                       '支出90元',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Text('支付宝'),
//                     Text('2021-02-25 17:11:30')
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

const String str =
    'https://scpic.chinaz.net/files/pic/pic9/201912/hpic1818.jpg';

class BillItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        str,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
