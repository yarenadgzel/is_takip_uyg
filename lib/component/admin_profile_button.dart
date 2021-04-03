import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constant/constant.dart';

class AdminProfileButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  const AdminProfileButton({this.icon, this.text,this.onTap});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      splashColor: Colors.grey,
      highlightElevation: 8,

      child: Container(
        margin: EdgeInsets.all(15),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: kIconColorProfilePage,
                size: 35,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                (text),
                style: kTextStyleProfilePage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
