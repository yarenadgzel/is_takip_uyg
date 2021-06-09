import 'package:flutter/material.dart';
import 'package:is_takip_uyg/admin_pages/login_page.dart';
import 'package:is_takip_uyg/component/admin/admin_tab_route.dart';
import 'package:is_takip_uyg/component/user/user_tab_route.dart';
import 'package:is_takip_uyg/models/LoggedInUser.dart';
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
      if (loggedInUser.uid == "U0CNgao6I0Y4SKwjyxaujzRHE6y2") {
        return AdminTabRoute();
      } else {
        return UserTabRoute();
      }
    }
  }
}
