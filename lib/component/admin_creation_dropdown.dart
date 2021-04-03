import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constant/constant.dart';

class AdminTaskDropdown extends StatefulWidget {
  @override
  _AdminTaskDropdownState createState() => _AdminTaskDropdownState();
}

class _AdminTaskDropdownState extends State<AdminTaskDropdown> {
  String value;
  List listItem = ["Yaren Adıgüzel", "Emre Aydın", "Berfin Bigün","Oğuz Çelik"];
  @override
  Widget build(BuildContext context) {
    return Center(
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
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
