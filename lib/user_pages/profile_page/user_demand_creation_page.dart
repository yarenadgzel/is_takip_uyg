import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/component/feedback_alert_dialog.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/models/Demand.dart';
import 'package:is_takip_uyg/services/auth_service.dart';
import 'package:is_takip_uyg/services/date_service.dart';
import 'package:is_takip_uyg/services/demand/database_service_demand.dart';

class UserDemandCreationPage extends StatefulWidget {
  @override
  _UserDemandCreationPageState createState() => _UserDemandCreationPageState();
}

class _UserDemandCreationPageState extends State<UserDemandCreationPage> {
  String startDate="";
  String finishDate="";
  String approvalDate="";
  DatabaseServiceDemand databaseServiceDemand=new DatabaseServiceDemand();
  AuthService authService=new AuthService();
  final myControllerDemandName = TextEditingController();
  final myControllerInfo = TextEditingController();
  final myControllerStatus = TextEditingController();
  Demand demand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Talep Oluşturma",
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
                            )),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 28),
                              child: TextField(
                                controller: myControllerDemandName,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
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
                                      child: Text(
                                        getCurrentTime(),
                                        style: TextStyle(color: Colors.black54,fontSize: 17),
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
                                    child: DateTimePicker(
                                      initialValue: '',
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                      onChanged: (val) => {
                                        this.startDate=val
                                      },
                                      onSaved: (val) => print(val),
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
                                Expanded(flex: 2, child: Text("Bitiş Tarihi")),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child: DateTimePicker(
                                        initialValue: '',
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                        onChanged: (val) => {
                                          this.finishDate=val
                                        },
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
                                Expanded(flex: 2, child: Text("Onay Tarihi")),
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 28),
                                      child:Text("Belirtilmedi")
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

              SizedBox(height: 15,),
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff02854B)),
                  child: GestureDetector(
                    onTap: () async {
                      createDemand(demand);
                      showFeedbackAlertDialog(context,
                          "Talebiniz başarılı bir şekilde oluşturulmuştur..");
                    },
                    child: Center(
                        child: Text(
                      "Oluştur",
                      style: kTextStyleTaskCreationButton,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createDemand(Demand demand) async {
    FirebaseUser user=await authService.getCurrentUser();
    demand = new Demand();
    demand.demandName = myControllerDemandName.text;
    demand.demandID = demand.demandID;
    demand.createrID = user.uid;
    demand.creationDate = getCurrentTime();
    demand.startDate = this.startDate;
    demand.finishDate = this.finishDate;
    demand.approvalDate = this.approvalDate;
    demand.status= demandStatusWaitingApprove;
    demand.info = myControllerInfo.text;
    await databaseServiceDemand.createDemand(demand);
    this.setState(() {
      this.demand = demand;
    });
  }
}
