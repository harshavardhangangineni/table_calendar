import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverlayExample extends StatelessWidget {
  DateTime mydate;
  OverlayExample(this.mydate);

  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black.withOpacity(.2),
        child: Center(
          child: Text("November",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              )),
        ),
      ),
    );

// OverlayEntry overlayEntry = OverlayEntry(
//         builder: (context) => Positioned(
//               top: MediaQuery.of(context).size.height / 2.0,
//               width: MediaQuery.of(context).size.width / 2.0,
//               child: CircleAvatar(
//                 radius: 50.0,
//                 backgroundColor: Colors.red,
//                 child: Text("1"),
//               ),
//             ));
    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(milliseconds: 500));

    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.1),
      child: Center(
        child: Text(
          DateTime.now().year == mydate.year
              ? DateFormat.MMMM().format(mydate).toUpperCase()
              : DateFormat.yMMMM().format(mydate).toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontFamily: "POPPINS", fontSize: 16),
        ),
      ),
    );
  }
}
