
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constant/constant.dart';

showFeedbackAlertDialog(BuildContext context, String content) {
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: kTextStyleAlertButton,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    backgroundColor: Colors.white,
    title: Text(
      "Uyarı",
      style: kTextStyleAlertTitle,
    ),
    content: Text(
      content,
      style: kTextStyleAlertContent,
    ),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}