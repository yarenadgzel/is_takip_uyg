import 'package:flutter/material.dart';

class AdminTaskTextfield extends StatelessWidget {
  final String text;

  final String hintText;
  final Function onChanged;
  final TextEditingController controller;
  AdminTaskTextfield({this.text,this.hintText,this.onChanged,this.controller});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 140,
        width: 400,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0)),
          child: Column(
            children: [
              SizedBox(height: 12,),
              Expanded(
                flex: 1,
                child: Text(
                  text,
                  style: TextStyle(
                    color:Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.grey,)),
                      hintStyle: TextStyle(color: Colors.black38),
                      hintText: hintText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
