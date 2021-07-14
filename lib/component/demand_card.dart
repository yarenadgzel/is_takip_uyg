
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/admin/admin_demand_alert_dialog.dart';
import 'package:is_takip_uyg/models/Demand.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';
import 'user/user_demand_alert_dialog.dart';

class DemandCard extends StatefulWidget {
  dynamic demand;
  final IconData icon;
  final Color color;
  final person;

  DemandCard({this.demand, this.icon, this.color,this.person}) ;

  @override
  _DemandCardState createState() => _DemandCardState();
}

class _DemandCardState extends State<DemandCard> {
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  String username = "";
  Demand report = new Demand();
  @override
  void initState() {
    super.initState();
    databaseServiceUsers.getUsernameByCurrentUser().then((value) => {
      this.setState(() {
        this.username = value;
      }),
    });
  }
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        widget.person=="user" ?
        showCustomDialogUserDemand(context, widget.demand): showCustomDialogAdminDemand(context, widget.demand);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 7, right: 7),
            height: 180,
            width: 460,
            child: Card(
              color: widget.color,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(
                          widget.icon,
                          color: Colors.white,
                          size: 50,
                        )),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "Talep Adı :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(widget.demand['demandName'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700))),
                            Expanded(
                                flex: 1,
                                child: Text("Oluşturan:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))),
                            Expanded(
                              flex: 2,
                              child: Text(username,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 120,
                        child: VerticalDivider(
                          width: 3,
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Başlangıç Tarihi:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                    widget.demand["startDate"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700))),
                            Expanded(
                                flex: 1,
                                child: Text("Bitiş Tarihi:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))),
                            Expanded(
                              flex: 2,
                              child: Text(
                                  widget.demand["finishDate"] == null
                                      ? ""
                                      : widget.demand["finishDate"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 17),
        ],
      ),
    );
  }
}
