import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/admin/admin_creation_textfield.dart';
import 'package:is_takip_uyg/component/feedback_alert_dialog.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/Task.dart';
import 'package:is_takip_uyg/services/date_service.dart';
import 'package:is_takip_uyg/services/tasks/database_service_tasks.dart';

class AdminTaskCretionPage extends StatefulWidget {
  @override
  _AdminTaskCretionPageState createState() => _AdminTaskCretionPageState();
}

class _AdminTaskCretionPageState extends State<AdminTaskCretionPage> {
  final myControllerTaskName= TextEditingController();
  final myControllerCompany= TextEditingController();
  final myControllerAddress= TextEditingController();
  final myControllerCreationDate= TextEditingController();
  final myControllerStartDate=TextEditingController();
  final myControllerFinishDate=TextEditingController();
  final myControllerInfo=TextEditingController();


  DatabaseServiceTask databaseServiceTask=new DatabaseServiceTask();
  Task task;
  String valueTaskType;
  List listItemTaskType = ["Servis", "Tamir Bakım", "Revizyon", "Yeni Proje"];
  String valueTaskStatus;
  List listItemTaskStatus = ["Beklemede", "Devam Ediyor", "Bitirildi"];
  String valueTaskUsers;
  List listItemUsers = ["Emre Aydın", "Berfin Bigün","Oğuz Çelik"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Yeni Görev Oluştur",
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
                               controller: myControllerTaskName,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
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
                    SizedBox(height: 12,),
                    Text(
                      "Yetkililer",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.people,
                              size: 42,
                              color:Color(0xff39969E),
                            )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 10, right: 28),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: DropdownButton(
                                  isExpanded: true,
                                  hint: Center(child: Text("Yetkili Seçiniz")),
                                  dropdownColor: Colors.white,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 36,
                                  underline: SizedBox(),
                                  style: kTextStyleDropdown,
                                  value: this.valueTaskUsers,
                                  onChanged: (newValue) {
                                    setState(() {
                                      this.valueTaskUsers = newValue;
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
                controller: myControllerCompany,
                text: "Firma",
                hintText: "Firma Adı",
              ),
              SizedBox(
                height: 20,
              ),
              AdminTaskTextfield(
                controller: myControllerAddress,
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
                                          child: Text("Görev türünü seçiniz")),
                                      dropdownColor: Colors.white,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 36,
                                      underline: SizedBox(),
                                      style: kTextStyleDropdown,
                                      value: this.valueTaskType,
                                      onChanged: (newValue) {
                                        setState(() {
                                          this.valueTaskType = newValue;
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
                                        child: Text("Görev durumunu seçiniz"),
                                      ),
                                      dropdownColor: Colors.white,
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 36,
                                      underline: SizedBox(),
                                      style: kTextStyleDropdown,
                                      value: this.valueTaskStatus,
                                      onChanged: (newValue) {
                                        setState(() {
                                          this.valueTaskStatus = newValue;
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
                                    flex: 2, child: Text("Oluşturma Tarihi")),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child: TextField(
                                        controller: myControllerCreationDate,
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
                                    flex: 2, child: Text("Başlama Tarihi")),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child: TextField(
                                        controller: myControllerStartDate,
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
                                Expanded(flex: 2, child: Text("Bitiş Tarihi")),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child: TextField(
                                        controller: myControllerFinishDate,
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
                                controller: myControllerInfo,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
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
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xff02854B) ),
                  child: GestureDetector(
                    onTap: () async {
                      await createTask(this.task);
                     showFeedbackAlertDialog(context, "Görev başarılı bir şekilde oluşturulmuştur..");
                    },
                    child: Center(child: Text("Oluştur",style: kTextStyleTaskCreationButton,)),
                  ),
                ),
              ),
            ],
            
          ),
        ),
      ),
    );
  }
  Future<void> createTask(Task task) async {
    task=new Task();
    task.taskName = myControllerTaskName.text;
    task.users = valueTaskUsers ;
    task.company = myControllerCompany.text;
    task.address = myControllerAddress.text;
    task.taskType = valueTaskType;
    task.taskStatus = valueTaskStatus;
    task.creationDate = getCurrentTime();
    task.startDate = myControllerStartDate.text;
    task.finishDate = myControllerFinishDate.text;
    task.info = myControllerInfo.text;
    await databaseServiceTask.createTask(task);
    this.setState(() {
      this.task = task;
    });
  }

}
