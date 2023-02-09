import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class CountDownContainer extends StatefulWidget {
//   const CountDownContainer({Key? key, required Widget child}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return CountDownContainerState();
//   }
// }
//
// class CountDownContainerState extends State<CountDownContainer> {
//   int count = 60;
//
//   bool showCount = false;
//
//   dynamic timer;
//
//   /// 倒计时
//   _countDown() {
//     if (showCount) return;
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (count > 0) {
//           showCount = true;
//           count--;
//         } else {
//           timer.cancel();
//           setState(() {
//             showCount = false;
//             count = 60;
//           });
//         }
//       });
//     });
//   }
//
//   /// 点击发送验证码
//   _handleTapSendVerifyCode() {
//     _countDown();
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     if()
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return GestureDetector(
//       onTap: _handleTapSendVerifyCode,
//       child: SizedBox(
//         width: showCount ? 100 : 80,
//         child: Align(
//           alignment: Alignment.centerRight,
//           child: Container(
//             padding:
//                 const EdgeInsets.only(top: 3, bottom: 3, left: 5, right: 5),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                     color: const Color.fromRGBO(
//                       253,
//                       126,
//                       126,
//                       1,
//                     ),
//                     width: 1)),
//             child: Text(
//               showCount ? '${count}s后重新发送' : '获取验证码',
//               style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w400,
//                 color: Color.fromRGBO(
//                   253,
//                   126,
//                   126,
//                   1,
//                 ),
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyCountDownContainer extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    throw UnimplementedError();
  }
  
}
