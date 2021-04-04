import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/get_data.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/Report.dart';
import 'package:is_takip_uyg/pages/login_page.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:is_takip_uyg/services/date_service.dart';
import 'package:is_takip_uyg/services/location_service.dart';
import 'package:is_takip_uyg/services/reports/database_service_reports.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService auth = new AuthService();
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  DatabaseServiceReports databaseServiceReports = new DatabaseServiceReports();

  GetDataList getDataList = new GetDataList();

  IconData icon = Icons.play_arrow;
  bool isActive = true;
  Report report;
  String username = "";

  @override
  void initState() {
    super.initState();
    databaseServiceUsers.getUsername().then((value) => {
          this.setState(() {
            this.username = value;
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
                      SizedBox(
                        width: 20,
                      ),
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
                  color: Color(0xff4CAF50),
                ),
                child: FlatButton(
                  onPressed: () async {
                    if (isActive == false) {
                      await finishReport(this.report);
                      icon = Icons.play_arrow;
                    } else {
                       await startReport(this.report);
                      //Todo Dialog çağır pop up
                      icon = Icons.pause;
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

  Future<void> startReport(Report report) async {
    report=new Report();
    FirebaseUser user = await auth.getCurrentUser();
    report.reportName = "";
    report.creater = user.uid;
    report.firstLocation = await getLocation();
    report.lastLocation = "";
    report.startTime = getCurrentTime();
    report.finishTime = "";
    report.status = "Başlatıldı";
    report.info = "";
    await databaseServiceReports.saveReport(report);
    this.setState(() {
      this.report=report;
    });
  }

  Future<void> finishReport(Report report) async {
    FirebaseUser user = await auth.getCurrentUser();
    report.reportName = "";
    report.creater = user.uid;
    report.firstLocation = await getLocation();
    report.lastLocation = await getLocation();
    report.startTime = getCurrentTime();
    report.finishTime = getCurrentTime();
    report.status = "Bitirildi";
    report.info = "";
    await databaseServiceReports.saveReport(report);
  }
}
