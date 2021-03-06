import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/feedback_alert_dialog.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/Demand.dart';
import 'package:is_takip_uyg/services/date_service.dart';
import 'package:is_takip_uyg/services/demand/database_service_demand.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

showCustomDialogAdminDemand(BuildContext context, dynamic demand) async {
  DatabaseServiceDemand databaseServiceDemand = new DatabaseServiceDemand();
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  String username =
      await databaseServiceUsers.getUsernameByUserID(demand['createrID']);
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
                                  const EdgeInsets.only(left: 80, right: 60),
                              child: Text(
                                "Talep Bilgisi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        )),
                    DemandAlertText(
                      headerText: "Talep Ad??",
                      contentText: demand["demandName"],
                    ),
                    DemandAlertText(
                      headerText: "Olu??turan",
                      contentText: username,
                    ),
                    DemandAlertText(
                      headerText: "Durum",
                      contentText: demand["status"],
                    ),
                    DemandAlertText(
                      headerText: "Olu??turma Tarihi",
                      contentText: demand["creationDate"],
                    ),
                    DemandAlertText(
                      headerText: "Ba??lang???? Tarihi",
                      contentText: demand["startDate"],
                    ),
                    DemandAlertText(
                      headerText: "Biti?? Tarihi",
                      contentText: demand["finishDate"],
                    ),
                    DemandAlertText(
                        headerText: "Onay Tarihi",
                        contentText: demand["approvalDate"]),
                    DemandAlertText(
                      headerText: "??nfo",
                      contentText: demand["info"],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AdminDemandAlertDialogButton(
                            text: "Kapat",
                            color: Color(0xff2a51a1),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          AdminDemandAlertDialogButton(
                              text: "Onayla",
                              color: Color(0xff02854b),
                              onPressed: () {
                                demand['approvalDate'] = getCurrentTime();
                                demand["status"] = "Onayland??";
                                Demand updatedDemand = new Demand();
                                updatedDemand.jsonToDemand(demand);
                                databaseServiceDemand
                                    .updateDemand(updatedDemand);
                                showFeedbackAlertDialog(context,
                                    "Talep ba??ar??l?? bir ??ekilde onaylanm????t??r..");
                              }),
                          SizedBox(
                            width: 20,
                          ),
                          AdminDemandAlertDialogButton(
                            text: "Reddet",
                            color: Color(0xffea4646),
                            onPressed: () {
                              demand['approvalDate'] = getCurrentTime();
                              demand["status"] = "Reddedildi";
                              Demand updatedDemand = new Demand();
                              updatedDemand.jsonToDemand(demand);
                              databaseServiceDemand.updateDemand(updatedDemand);
                              showFeedbackAlertDialog(context,
                                  "Talep ba??ar??l?? bir ??ekilde reddedilmi??tir..");
                            },
                          ),
                        ],
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

class AdminDemandAlertDialogButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  AdminDemandAlertDialogButton({this.text, this.color, this.onPressed});

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

class DemandAlertText extends StatelessWidget {
  final String headerText;
  final String contentText;

  const DemandAlertText({Key key, this.headerText, this.contentText})
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
