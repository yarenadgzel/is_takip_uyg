import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/admin_pages/login_page.dart';
import 'package:is_takip_uyg/component/report_alert_dialog.dart';
import 'package:is_takip_uyg/component/report_list_by_date.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/Report.dart';
import 'package:is_takip_uyg/models/Task.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:is_takip_uyg/services/location_service.dart';
import 'package:is_takip_uyg/services/reports/database_service_reports.dart';
import 'package:is_takip_uyg/services/tasks/database_service_tasks.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

const oneDay = 60 * 60 * 24 * 1000;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Task task;

  AuthService auth = new AuthService();
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  DatabaseServiceReports databaseServiceReports = new DatabaseServiceReports();
  bool isActive = true;
  Report report;
  String username = "";
  bool isStarted = false;

  @override
  void initState() {
    super.initState();
    databaseServiceUsers.getUsernameByCurrentUser().then((value) => {
          this.setState(() {
            this.username = value;
          }),
        });
    databaseServiceReports.getReportByCurrentUser().then((value) => {
          for (var report in value.documents)
            {
              if ((DateTime.now().difference(DateTime.parse(
                          report['startTime'].toDate().toString())))
                      .inMilliseconds <=
                  oneDay)
                {
                  if (report["status"] == "Başlatıldı")
                    {
                      this.isStarted = true,
                      this.report = new Report(),
                      this.report.jsonToReport(report.data)
                    }
                }
            }
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
                    if (isStarted) {
                      await finishReport(this.report);
                    } else {
                      await startReport(this.report);
                    }
                    setState(() {
                      isStarted = !isStarted;
                    });
                  },
                  child: Icon(
                    isStarted ? Icons.pause : Icons.play_arrow,
                    size: 55,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ReportListByDate(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> startReport(Report report) async {
    report = new Report();
    FirebaseUser user = await auth.getCurrentUser();
    report.reportName = "";
    report.creater = user.uid;
    report.firstLocation = await getLocation();
    report.lastLocation = "";
    report.startTime = Timestamp.now();
    report.finishTime = null;
    report.status = "Başlatıldı";
    report.info = "";
    await databaseServiceReports.saveReport(report);
    this.setState(() {
      this.report = report;
    });
  }

  Future<void> finishReport(Report report) async {
    FirebaseUser user = await auth.getCurrentUser();
    report.reportName = report.reportName;
    report.creater = user.uid;
    report.firstLocation = report.firstLocation;
    report.lastLocation = await getLocation();
    report.startTime = report.startTime;
    report.finishTime = Timestamp.now();
    report.status = "Bitirildi";
    report.info = report.info;
    showCustomDialogReport(context, report);
    //await databaseServiceReports.saveReport(report);
  }
}
