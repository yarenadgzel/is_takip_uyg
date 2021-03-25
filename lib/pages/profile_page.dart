import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:is_takip_uyg/constant/constant.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          "Profil",
          style: kAppBarStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ProfileButton(
              icon: Icons.assignment,
              text: "Raporlarım",
              onTap: (){
                print("Raporlarıma basıldı");
              },
            ),
            SizedBox(height: 20),
            ProfileButton(
              icon: Icons.insert_invitation,
              text: "Görevlerim",
              onTap: (){
                print("Görevlerime basıldı");
              },
            ),
            SizedBox(height: 20),
            ProfileButton(
              icon: Icons.how_to_reg,
              text: "Taleplerim",
              onTap: (){
                print("Taleplerime basıldı");
              },
            ),
          ],
        ),
      ),
    );
  }
}
class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  const ProfileButton({this.icon, this.text,this.onTap});
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
