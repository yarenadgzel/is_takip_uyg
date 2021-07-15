import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/feedback_alert_dialog.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/Report.dart';
import 'package:is_takip_uyg/models/Task.dart';
import 'package:is_takip_uyg/services/reports/database_service_reports.dart';
import 'package:is_takip_uyg/services/tasks/database_service_tasks.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

Future<void> showCustomDialogReport(BuildContext context, Report report) async {
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  DatabaseServiceTask databaseServiceTask = new DatabaseServiceTask();

  TextEditingController reportNameController =
      new TextEditingController(text: report.reportName);
  TextEditingController infoController =
      new TextEditingController(text: report.info);

  String username = await databaseServiceUsers.getUsernameByCurrentUser();
  List userTaskList =
      await databaseServiceTask.getDropdownTaskListByUsername(username);
  bool isStarted = true;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 10,
              backgroundColor: Colors.transparent,
              content: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(12),
                          height: 50.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xff455a64),
                          ),
                          child: Text(
                            "Rapor Bilgisi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                      DialogReportTextField(
                        controller: reportNameController,
                        text: "Rapor Adı",
                        onChanged: (text) {
                          report.reportName = text;
                        },
                      ),
                      TaskListDropdown(report, setState, userTaskList),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Oluşturan",
                                  style: kTextStyleReportDialog,
                                )),
                            Expanded(
                              flex: 5,
                              child: Text(
                                username,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Başlangıç Saati",
                                  style: kTextStyleReportDialog,
                                )),
                            Expanded(
                              flex: 5,
                              child: Text(
                                report.startTime.toDate().toString(),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Bitiş Saati",
                                  style: kTextStyleReportDialog,
                                )),
                            Expanded(
                              flex: 5,
                              child: Text(
                                report.finishTime != null
                                    ? report.finishTime.toDate().toString()
                                    : "",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(
                                  "Durumu",
                                  style: kTextStyleReportDialog,
                                )),
                            Expanded(
                                flex: 5,
                                child: Text(report.status,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18))),
                          ],
                        ),
                      ),
                      DialogReportTextField(
                        controller: infoController,
                        text: "Bilgi",
                        onChanged: (text) {
                          report.info = text;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ReportDialogButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: "Kapat",
                              color: Color(0xff2a51a1),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ReportDialogButton(
                              onPressed: () async {
                                await deleteReport(report);
                                showFeedbackAlertDialog(context,
                                    "Rapor başarılı bir şekilde silinmiştir");
                              },
                              text: "Sil",
                              color: Color(0xffea4646),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ReportDialogButton(
                              onPressed: () async {
                                await saveReport(report);
                                showFeedbackAlertDialog(context,
                                    "Rapor başarılı bir şekilde kaydedilmiştir..");
                              },
                              text: "Kaydet",
                              color: Color(0xff02854b),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget TaskListDropdown(
    Report report, StateSetter setState, List userTaskList) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Expanded(flex: 3, child: Text("Görev", style: kTextStyleReportDialog)),
        Expanded(
          flex: 5,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton(
              isExpanded: true,
              hint: Center(
                child: Text(
                  "Görev Seçiniz",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              dropdownColor: Colors.white,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
              iconSize: 36,
              underline: SizedBox(),
              style: kTextStyleDropdown,
              value: report.taskID,
              onChanged: (newValue) {
                setState(() {
                  report.taskID = newValue;
                });
              },
              items: userTaskList.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem.value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(valueItem.key),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ),
  );
}

Future<void> saveReport(Report report) async {
  DatabaseServiceReports databaseServiceReports = new DatabaseServiceReports();
  await databaseServiceReports.saveReport(report);
}

deleteReport(Report report) async {
  print("deleteReport");
  print("report: ${report}");
  DatabaseServiceReports databaseServiceReports = new DatabaseServiceReports();
  await databaseServiceReports.deleteReportsByID(report);
}

class ReportDialogButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  ReportDialogButton({this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
    );
  }
}

class DialogReportTextField extends StatelessWidget {
  final String text;
  final Function onChanged;
  final TextEditingController controller;

  DialogReportTextField({this.text, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(flex: 3, child: Text(text, style: kTextStyleReportDialog)),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6)),
              height: 45,
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: TextStyle(color: Colors.black, fontSize: 17),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
