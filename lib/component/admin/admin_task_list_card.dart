import 'package:flutter/material.dart';
import 'package:is_takip_uyg/constant/constant.dart';

class AdminTaskListCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final Color iconColor;
  final Color color;
  final Function onTap;

  AdminTaskListCard(
      {this.title, this.subtitle, this.iconData, this.color, this.iconColor,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap:onTap,
        child: Container(
          height: 126,
          width: 400,
          child: Card(
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0)),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: kTextStyleAdminTaskListTitle,
                        ),
                        Container(
                            width: 200,
                            child: Divider(
                              thickness: 3,
                              color: Colors.white,
                            )),
                        Text(
                          subtitle,
                          style: kTextStyleAdminTaskListSubtitle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Icon(
                    iconData,
                    size: 60,
                    color: iconColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
