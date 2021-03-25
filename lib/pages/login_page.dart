import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:is_takip_uyg/component/tab_route.dart';
import 'package:is_takip_uyg/constant/constant.dart';
import 'package:is_takip_uyg/services/auth_service.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;

  AuthService auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x6630475e),
                        Color(0x9930475e),
                        Color(0xE630475e),
                        Color(0xFF30475e),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(vertical: 120.0, horizontal: 25.0),
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        buildEmail(),
                        SizedBox(
                          height: 20.0,
                        ),
                        buildPassword(),
                        SizedBox(
                          height: 30.0,
                        ),
                        buildLoginBtn(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) {
              this.email = text;
            },
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: kIconColorLoginPage,
              ),
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.black38),
            ),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60,
          child: TextField(
            obscureText: true,
            onChanged: (text) {
              this.password = text;
            },
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: kIconColorLoginPage,
              ),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.black38),
            ),
          ),
        )
      ],
    );
  }

  Widget buildLoginBtn(context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25,
      ),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          login();
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    print("email: " + email);
    print("password: " + password);

    auth
        .signWithEmailAndPassword(email, password)
        .then((value) => {
              print("Başarılı oldu!"),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TabRoute(),
                ),
              )
            })
        .catchError((onError) => {print("hata")});
  }
}
