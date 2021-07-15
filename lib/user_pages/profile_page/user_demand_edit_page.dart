import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/Demand.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:is_takip_uyg/services/demand/database_service_demand.dart';

class UserDemandEditPage extends StatefulWidget {
  dynamic demand;

  UserDemandEditPage(dynamic demand) {
    this.demand = demand;
  }

  @override
  _UserDemandEditPageState createState() => _UserDemandEditPageState();
}

class _UserDemandEditPageState extends State<UserDemandEditPage> {
  AuthService authService = new AuthService();
  DatabaseServiceDemand databaseServiceDemand = new DatabaseServiceDemand();
  TextEditingController demandNameController;
  TextEditingController startDateController;
  TextEditingController finishDateController;
  TextEditingController infoController;

  @override
  void initState() {
    print("init state");
    super.initState();
    if (widget.demand != null) {
      this.demandNameController =
          new TextEditingController(text: widget.demand['demandName']);
      this.startDateController =
          new TextEditingController(text: widget.demand['startDate']);
      this.finishDateController =
          new TextEditingController(text: widget.demand['finishDate']);
      this.infoController =
          new TextEditingController(text: widget.demand['info']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Talebi Düzenle",
          style: kAppBarStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 110,
                  width: 400,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.contact_mail,
                            size: 42,
                            color: Color(0xff39969E),
                          ),
                        ),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 28),
                              child: TextField(
                                controller: demandNameController,
                                onChanged: (value) {
                                  setState(() {
                                    print("value : ${value}");
                                    widget.demand['demandName'] = value;
                                    print("widget.demand:" + widget.demand['demandName']);
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintStyle: TextStyle(color: Colors.black38),
                                  hintText: "Talep Adı",
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 280,
                  width: 400,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Tarihler",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.schedule,
                                      size: 42,
                                      color: Color(0xff39969E),
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Oluşturma Tarihi",
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child: Text(
                                        widget.demand["creationDate"],
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.schedule,
                                      size: 42,
                                      color: Color(0xff39969E),
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Başlama Tarihi",
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    )),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 28),
                                    child: DateTimePicker(
                                      controller: startDateController,
                                      onChanged: (val) => {
                                        setState(() {
                                          widget.demand['startDate'] = val;
                                        })
                                      },
                                      style: TextStyle(color: Colors.black87),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.schedule,
                                      size: 42,
                                      color: Color(0xff39969E),
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Bitiş Tarihi",
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child: DateTimePicker(
                                        controller: finishDateController,
                                        onChanged: (val) => {
                                          setState(() {
                                            widget.demand['finishDate'] = val;
                                          })
                                        },
                                        style: TextStyle(color: Colors.black87),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                        onSaved: (val) => print(val),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.schedule,
                                      size: 42,
                                      color: Color(0xff39969E),
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Onay Tarihi",
                                      style: TextStyle(
                                        color: Colors.black87,
                                      ),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child: Text(
                                        widget.demand["approvalDate"],
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 110,
                  width: 400,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.insert_comment,
                              size: 42,
                              color: Color(0xff39969E),
                            )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 28),
                              child: TextField(
                                controller: infoController,
                                onChanged: (value) {
                                  setState(() {
                                    widget.demand['info'] = value;
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintStyle: TextStyle(color: Colors.black38),
                                  hintText: "İnfo",
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DemandDialogButton(
                    text: "Kapat",
                    color: Color(0xff2a51a1),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DemandDialogButton(
                    text: "Sil",
                    color: Color(0xffea4646),
                    onPressed: () async {
                      Demand demand = new Demand();
                      demand.jsonToDemand(widget.demand);
                      await databaseServiceDemand.deleteDemand(demand);
                      showFeedbackDemandEditAlertDialog(
                        context,
                        "Talep başarılı bir şekilde silinmiştir..",
                      );
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DemandDialogButton(
                    text: "Güncelle",
                    color: Color(0xff02854b),
                    onPressed: () async {
                      Demand demand = new Demand();
                      demand.jsonToDemand(widget.demand);
                      await databaseServiceDemand.updateDemand(demand);
                      showFeedbackDemandEditAlertDialog(
                        context,
                        "Talep başarılı bir şekilde güncellenmiştir.",
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DemandDialogButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  DemandDialogButton({this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      child: RaisedButton(
        color: color,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)),
      ),
    );
  }
}

showFeedbackDemandEditAlertDialog(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        title: Text(
          "Bilgi",
          style: kTextStyleAlertTitle,
        ),
        content: Text(
          content,
          style: kTextStyleAlertContent,
        ),
        actions: [
          FlatButton(
            child: Text(
              "OK",
              style: kTextStyleAlertButton,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  )
      .then((value) => Navigator.pop(context))
      .then((value) => Navigator.pop(context));
}
