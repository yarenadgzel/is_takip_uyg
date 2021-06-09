import 'package:flutter/material.dart';
import 'package:is_takip_uyg/admin_pages/task/admin_task_edit_page.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

showCustomDialogTask(BuildContext context, dynamic task) async {
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  String username = await databaseServiceUsers.getUsernameByCurrentUser();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xff455a64),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 120, right: 60),
                              child: Text(
                                "Görev Bilgisi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  size: 32,
                                ),
                                onPressed: () {
                                  print("editPage");
                                  print("param: ${task}");
                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>AdminTaskEditPage(task)));
                                }),
                          ],
                        )),
                    TaskAlertText(
                      headerText: "Görev Adı",
                      contentText: task["taskName"],
                    ),
                    TaskAlertText(
                      headerText: "Oluşturan",
                      contentText: username,
                    ),
                    TaskAlertText(
                      headerText: "Yetkili",
                      contentText: task["users"],
                    ),
                    TaskAlertText(
                      headerText: "Firma",
                      contentText: task["company"],
                    ),
                    TaskAlertText(
                      headerText: "Adres",
                      contentText: task["address"],
                    ),
                    TaskAlertText(
                        headerText: "Görev Tipi",
                        contentText: task["taskType"]),
                    TaskAlertText(
                      headerText: "Görevin Durumu",
                      contentText: task["taskStatus"],
                    ),
                    TaskAlertText(
                      headerText: task["users"],
                      contentText: task["taskStatus"],
                    ),
                    TaskAlertText(
                      headerText: "Oluşturma Tarihi",
                      contentText: task["creationDate"],
                    ),
                    TaskAlertText(
                      headerText: "Başlama Tarihi",
                      contentText: task["startDate"],
                    ),
                    TaskAlertText(
                      headerText: "Bitiş Tarihi",
                      contentText: task["finishDate"],
                    ),
                    TaskAlertText(
                      headerText: "Durum",
                      contentText: task["info"],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          width: 350,
                          height: 40,
                          child: RaisedButton(
                            color: Color(0xff2a51a1),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Kapat",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      );
    },
  );
}

class TaskAlertText extends StatelessWidget {
  final String headerText;
  final String contentText;

  const TaskAlertText({Key key, this.headerText, this.contentText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 12, top: 15),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                headerText,
                style: kTextStyleReportDialog,
              )),
          SizedBox(
            width: 30,
          ),
          Expanded(
              flex: 5,
              child: Text(contentText,
                  style: TextStyle(color: Colors.black87, fontSize: 21))),
        ],
      ),
    );
  }
}
