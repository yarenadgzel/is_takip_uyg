import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/get_data.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/Report.dart';
import 'package:is_takip_uyg/pages/login_page.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:is_takip_uyg/services/reports/database_service_reports.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isActive = true;
  IconData icon = Icons.play_arrow;
  AuthService auth = new AuthService();
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  DatabaseServiceReports databaseServiceReports = new DatabaseServiceReports();
  GetDataList getDataList = new GetDataList();
  Report report = new Report();
  String lastName = "";
  String name = "";
  String username = "";

  @override
  void initState() {
    super.initState();
    getDataList.getUsername().then((value) =>
    {
      this.setState(() {
        username = value;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Anasayfa",
          style: kAppBarStyle,
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.power_settings_new_outlined),
                onPressed: () {
                  auth.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage('assets/images/image.png'),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        username,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.green,
                ),
                child: FlatButton(
                  onPressed: () {
                    if (isActive == false) {
                      icon = Icons.play_arrow;
                    } else {
                      icon = Icons.pause;
                      report.reportName = "Deneme";
                      report.creater = "Yaren";
                      report.firstLocation = "Edirne";
                      report.lastLocation = "Edirne";
                      report.startTime = "29.03.2021";
                      report.finishTime = "30.03.2021";
                      report.status = "Başlatıldı";
                      report.info = "Deneme yapılıyor.";
                      databaseServiceReports.createReport(report);
                      // getLocation().then((value) => {report.firstLocation = value});
                      // getCurrentTime();
                    }
                    setState(() {
                      isActive = !isActive;
                    });
                  },
                  child: Icon(
                    icon,
                    size: 55,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
