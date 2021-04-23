
import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/services/users/database_service_users.dart';

Future<void> showCustomDialog(BuildContext context) async {
  DatabaseServiceUsers databaseServiceUsers = new DatabaseServiceUsers();
  String username = await databaseServiceUsers.getUsernameByCurrentUser();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                      text: "Rapor Adı",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text("Görev", style: kTextStyleReportDialog)),
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.grey, width: 1)),
                              child: ReportAlertDropdown(),
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
                                "Oluşturan",
                                style: kTextStyleReportDialog,
                              )),
                          Expanded(
                              flex: 5,
                              child: Text(username,
                                  style:
                                  TextStyle(color: Colors.grey, fontSize: 18))),
                        ],
                      ),
                    ),
                    DialogReportTextField(
                      text: "Başlangıç Saati",
                    ),
                    DialogReportTextField(
                      text: "Bitiş Saati",
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
                              child: Text("Bitirildi",
                                  style:
                                  TextStyle(color: Colors.grey, fontSize: 18))),
                        ],
                      ),
                    ),
                    DialogReportTextField(
                      text: "Bilgi",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ReportDialogButton(text: "Kapat",color: Color(0xff2a51a1),),
                          SizedBox(width: 20,),
                          ReportDialogButton(text: "Sil",color: Color(0xffea4646),),
                          SizedBox(width: 20,),
                          ReportDialogButton(text: "Kaydet",color: Color(0xff02854b),),
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

class ReportAlertDropdown extends StatefulWidget {
  @override
  _ReportAlertDropdownState createState() => _ReportAlertDropdownState();
}

class _ReportAlertDropdownState extends State<ReportAlertDropdown> {
  String value;
  List listItem = ["Deneme", "Deneme 2"];


  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      hint: Center(child: Text("Görev Seçiniz")),
      dropdownColor: Colors.white,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 36,
      underline: SizedBox(),
      style: kTextStyleDropdown,
      value: this.value,
      onChanged: (newValue) {
        setState(() {
          this.value = newValue;
        });
      },
      items: listItem.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }
}
class ReportDialogButton extends StatelessWidget {
  final String text;
  final Color color;
  ReportDialogButton({this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color:color,
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500),
      ),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
    );
  }
}

class DialogReportTextField extends StatelessWidget {
  final String text;
  DialogReportTextField({this.text});
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
              decoration:BoxDecoration(border:Border.all(color:Colors.grey),borderRadius: BorderRadius.circular(6)),
              height: 45,
              child: TextField(
                style:TextStyle(color:Colors.black,fontSize: 17),
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