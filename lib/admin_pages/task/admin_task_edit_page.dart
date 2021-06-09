import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/feedback_aler_dialog.dart';
import 'file:///D:/flutter_workspace/is_takip_uyg/lib/component/admin/admin_creation_textfield.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/Task.dart';
import 'package:is_takip_uyg/services/date_service.dart';
import 'package:is_takip_uyg/services/tasks/database_service_tasks.dart';

class AdminTaskEditPage extends StatefulWidget {
  dynamic task;

  AdminTaskEditPage(dynamic task) {
    print('AdminTaskEditPage');
    print('task cnt: ${task}');
    this.task = task;
  }

  @override
  _AdminTaskEditPageState createState() => _AdminTaskEditPageState();
}

class _AdminTaskEditPageState extends State<AdminTaskEditPage> {
  TextEditingController taskNameController;
  TextEditingController companyController;
  TextEditingController addressController;
  TextEditingController creationDateController;
  TextEditingController startDateController;
  TextEditingController finishDateController;
  TextEditingController infoController;

  DatabaseServiceTask databaseServiceTask = new DatabaseServiceTask();
  List listItemTaskType = ["Servis", "Tamir Bakım", "Revizyon", "Yeni Proje"];
  List listItemTaskStatus = ["Beklemede", "Devam Ediyor", "Bitirildi"];
  List listItemUsers = [
    "Emre Aydın",
    "Berfin Bigün",
    "Oğuz Çelik"
  ];

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      this.taskNameController =
          new TextEditingController(text: widget.task['taskName']);
      this.companyController =
          new TextEditingController(text: widget.task['company']);
      this.addressController =
          new TextEditingController(text: widget.task['address']);
      this.creationDateController =
          new TextEditingController(text: widget.task['creationDate']);
      this.startDateController =
          new TextEditingController(text: widget.task['startDate']);
      this.finishDateController =
          new TextEditingController(text: widget.task['finishDate']);
      this.infoController =
          new TextEditingController(text: widget.task['info']);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("task2: ${widget.task}");
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Görevi Düzenleme",
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
                              Icons.insert_invitation,
                              size: 42,
                              color: Color(0xff39969E),
                            )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 28),
                              child: TextField(
                                controller: taskNameController,
                                onChanged: (value) {
                                  setState(() {
                                    widget.task['taskName'] = value;
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                                  hintStyle: TextStyle(color: Colors.black38),
                                  hintText: "Görev Adı",
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
                  height: 130,
                  width: 400,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Yetkililer",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.people,
                                  size: 42,
                                  color: Color(0xff39969E),
                                )),
                            Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 28),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: Center(
                                          child: Text(
                                        "Yetkili seçiniz",
                                        style: TextStyle(color: Colors.black38),
                                      )),
                                      dropdownColor: Colors.white,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 36,
                                      underline: SizedBox(),
                                      style: kTextStyleDropdown,
                                      value: widget.task['users'],
                                      onChanged: (newValue) {
                                        setState(() {
                                          widget.task['users'] = newValue;
                                        });
                                      },
                                      items: listItemUsers.map((valueItem) {
                                        return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AdminTaskTextfield(
                onChanged: (value) {
                  setState(() {
                    widget.task['company'] = value;
                  });
                },
                controller: companyController,
                text: "Firma",
                hintText: "Firma Adı",
              ),
              SizedBox(
                height: 20,
              ),
              AdminTaskTextfield(
                onChanged: (value) {
                  setState(() {
                    widget.task['address'] = value;
                  });
                },
                controller: addressController,
                text: "Adres",
                hintText: "Adres",
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 130,
                  width: 400,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Görev Türü",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.insert_invitation,
                                  size: 42,
                                  color: Color(0xff39969E),
                                )),
                            Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 28),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: Center(
                                          child: Text(
                                        "Görev türünü seçiniz",
                                        style: TextStyle(color: Colors.black38),
                                      )),
                                      dropdownColor: Colors.white,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 36,
                                      underline: SizedBox(),
                                      style: kTextStyleDropdown,
                                      value: widget.task['taskType'],
                                      onChanged: (newValue) {
                                        setState(() {
                                          widget.task['taskType'] = newValue;
                                        });
                                      },
                                      items: listItemTaskType.map((valueItem) {
                                        return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )),
                          ],
                        ),
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
                  height: 130,
                  width: 400,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Görev Durumu",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.date_range,
                                  size: 42,
                                  color: Color(0xff39969E),
                                )),
                            Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 28),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: Center(
                                        child: Text("Görev durumunu seçiniz",
                                            style: TextStyle(
                                                color: Colors.black38)),
                                      ),
                                      dropdownColor: Colors.white,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 36,
                                      underline: SizedBox(),
                                      style: kTextStyleDropdown,
                                      value: widget.task['taskStatus'],
                                      onChanged: (newValue) {
                                        setState(() {
                                          widget.task['taskStatus'] = newValue;
                                        });
                                      },
                                      items:
                                          listItemTaskStatus.map((valueItem) {
                                        return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )),
                          ],
                        ),
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
                  height: 250,
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
                                fontSize: 22,
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
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            widget.task['creationDate'] = value;
                                          });
                                        },
                                        controller: creationDateController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                              TextStyle(color: Colors.black38),
                                          hintText: getCurrentTime(),
                                        ),
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
                                    child: Text("Başlama Tarihi",
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ))),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            widget.task['startDate'] = value;
                                          });
                                        },
                                        controller: startDateController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                              TextStyle(color: Colors.black38),
                                          hintText: "dd/mm/yyyy",
                                        ),
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
                                    child: Text("Bitiş Tarihi",
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ))),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            widget.task['finishDate'] = value;
                                          });
                                        },
                                        controller: finishDateController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintStyle:
                                              TextStyle(color: Colors.black38),
                                          hintText: "dd/mm/yyyy",
                                        ),
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
                                onChanged: (value) {
                                  setState(() {
                                    widget.task['info'] = value;
                                  });
                                },
                                controller: infoController,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                                  hintStyle: TextStyle(color: Colors.black38),
                                  hintText: "Bilgi",
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
                  TaskDialogButton(
                    text: "Kapat",
                    color: Color(0xff2a51a1),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 20,),
                  TaskDialogButton(
                    text: "Sil",
                    color: Color(0xffea4646),
                    onPressed: () async {
                      Task task = new Task();
                      task.jsonToTask(widget.task);
                      await databaseServiceTask.deleteTask(task);
                      showFeedbackAlertDialog(context,"Görev başarılı bir şekilde silinmiştir.");
                    },
                  ),
                  SizedBox(width: 20,),
                  TaskDialogButton(
                    text: "Güncelle",
                    color: Color(0xff02854b),
                    onPressed: () async {
                      Task task = new Task();
                      task.jsonToTask(widget.task);
                      await databaseServiceTask.updateTask(task);
                      showFeedbackAlertDialog(context,"Görev başarılı bir şekilde güncellenmiştir.");
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

class TaskDialogButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  TaskDialogButton({this.text, this.color, this.onPressed});

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
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
      ),
    );
  }
}
