import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/demand_all_list.dart';
import 'package:is_takip_uyg/component/demand_list.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/user_pages/profile_page/user_demand_creation_page.dart';

class AdminDemandListPage extends StatefulWidget {
  @override
  _AdminDemandListPageState createState() => _AdminDemandListPageState();
}

class _AdminDemandListPageState extends State<AdminDemandListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Talepler",
          style: kAppBarStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 18,),
            DemandAllList(),
          ],
        ),
      ),
    );
  }
}
