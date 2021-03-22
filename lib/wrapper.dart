import 'package:flutter/material.dart';
import 'package:is_takip_uyg/models/LoggedInUser.dart';
import 'package:is_takip_uyg/pages/login_page.dart';
import 'file:///D:/flutter_workspace/is_takip_uyg/lib/component/tab_route.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loggedInUser = Provider.of<LoggedInUser>(context);
    loggedInUser != null
        ? print("loggedInUser --> " + loggedInUser.uid)
        : print("Not signin user");

    if (loggedInUser == null) {
      return LoginPage();
    } else {
      return TabRoute();
    }
  }
}
