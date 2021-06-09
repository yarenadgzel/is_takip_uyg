import 'package:flutter/material.dart';
import 'file:///D:/flutter_workspace/is_takip_uyg/lib/component/admin/admin_task_alert_dialog.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

class TaskCard extends StatefulWidget {
  dynamic task;

  TaskCard({
    this.task,
  });

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  String username = "";

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
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            showCustomDialogTask(context, widget.task.data);
          },
          child: Container(
            padding: EdgeInsets.only(left: 7, right: 7),
            height: 340,
            width: 460,
            child: Card(
              color: widget.task["taskStatus"] == "Beklemede"
                  ? Color(0xffa3605d)
                  : widget.task["taskStatus"] == "Bitirildi"
                  ? Colors.green
                  : Color(0xbfeb9052),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12.0),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.event_busy,
                                  color: Colors.white,
                                  size: 60,
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
                                          "Görev Adı:",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 13),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(widget.task["taskName"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700))),
                                    Expanded(
                                        flex: 1,
                                        child: Text("Oluşturan:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13))),
                                    Expanded(
                                      flex: 2,
                                      child: Text("Yaren Adıgüzel",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Görev Tipi:",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 13),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(widget.task["taskType"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700))),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Firma:",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 13),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(widget.task["company"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700))),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 220,
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
                                          "Oluşturma Tarihi:",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 13),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(widget.task["creationDate"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700))),
                                    Expanded(
                                        flex: 1,
                                        child: Text("Başlangıç Tarihi:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13))),
                                    Expanded(
                                      flex: 2,
                                      child: Text(widget.task["startDate"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Text("Bitiş Tarihi:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13))),
                                    Expanded(
                                      flex: 2,
                                      child: Text(widget.task["finishDate"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Divider(height: 70, color: Colors.white)),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text("Kullanıcılar:",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14))),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person,
                                        size: 20, color: Colors.white),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(widget.task["users"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
