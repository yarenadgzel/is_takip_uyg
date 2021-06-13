import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constant/constant.dart';

showFeedbackAlertDialog(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        title: Text(
          "Bilgi",
          style: kTextStyleAlertTitle,
        ),
        content: Text(
          content,
          style: kTextStyleAlertContent,
        ),
        actions: [
          FlatButton(
            child: Text(
              "OK",
              style: kTextStyleAlertButton,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  ).then((value) => Navigator.pop(context));
}
