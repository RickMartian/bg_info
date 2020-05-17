import 'package:flutter/material.dart';

class Modal {
  mainBottomSheet(BuildContext context, Widget widget, double height) {
    return showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(10.0),
          height: height,
          child: widget,
        );
      },
    );
  }
}
