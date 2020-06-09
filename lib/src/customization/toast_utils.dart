import 'dart:async';

import 'package:flutter/material.dart';

class ToastUtils {
  static Timer toastTimer;
  static OverlayEntry _overlayEntry;

  static void showCustomToast(BuildContext context, String message) {
    if (toastTimer == null || !toastTimer.isActive) {
      _overlayEntry = createOverlayEntry(context, message);
      Overlay.of(context).insert(
        _overlayEntry,
      );
      toastTimer = Timer(Duration(seconds: 3), () {
        if (_overlayEntry != null) {
          _overlayEntry.remove();
        }
      });
    }
  }

  static OverlayEntry createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
      builder: (context) => Stack(children: <Widget>[
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        Positioned(
          bottom: 80.0,
          width: MediaQuery.of(context).size.width - 50,
          left: 25,
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      child: Text(message,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                              fontFamily: "POPPINS")))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
