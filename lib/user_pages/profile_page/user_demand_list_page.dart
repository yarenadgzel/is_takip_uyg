import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/demand_list.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/user_pages/profile_page/user_demand_creation_page.dart';

class UserDemandListPage extends StatefulWidget {
  @override
  _UserDemandListPageState createState() => _UserDemandListPageState();
}

class _UserDemandListPageState extends State<UserDemandListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Taleplerim",
          style: kAppBarStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserDemandCreationPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF1C313A),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 18,),
            DemandList(),
          ],
        ),
      ),
    );
  }
}
