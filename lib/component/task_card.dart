import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constants/constant.dart';
class taskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.green,
      height: 80,
      width: 290,
      child: Card(
        child:ListTile(
          leading: Icon(Icons.insert_invitation,color:Color(0xFF30475e)),
          title: Text("Görev Tipi : Servis Görevi",style: kExpansionTextStyle,),
        ),
      ),
    );

  }
}
