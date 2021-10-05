import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Services/auth/auth.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Stack(children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    1, 1), // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  kPrimaryColor,
                  kPrimaryLightColor
                ], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: Container(
                padding: EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      child: Icon(CupertinoIcons.profile_circled, size: 50),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Đỗ Dương Tâm Đăng',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                          Text('0774839222',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  letterSpacing: 0.5)),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 50),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(35)),
                        child: InkWell(
                            onTap: () async {
                              await loginProvider.logout(context: context);
                              Get.offAllNamed("/");
                            },
                            child: Icon(Icons.exit_to_app)))
                  ],
                )),
          ),
          Positioned(
            bottom: -10,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200)),
                color: kBackgroundColor,
              ),
              width: size.width,
              height: 35,
              child: SizedBox(
                height: 10,
              ),
            ),
          )
        ]),
        SizedBox(height: 40),
        Center(
            //Logo
            child: Icon(CupertinoIcons.profile_circled, size: 120)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(kPrimaryLightColor),
                ),
                onPressed: () => {},
                icon: Icon(
                  CupertinoIcons.upload_circle,
                  color: CupertinoColors.black,
                  size: 28,
                ),
                label: Text('Upload Avatar',
                    style: TextStyle(
                        color: CupertinoColors.black,
                        fontWeight: FontWeight.bold))),
            SizedBox(width: 25),
            ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(kPrimaryLightColor),
                ),
                onPressed: () => {},
                icon: Icon(
                  CupertinoIcons.delete,
                  color: CupertinoColors.black,
                  size: 28,
                ),
                label: Text('Delete Avatar',
                    style: TextStyle(
                        color: CupertinoColors.black,
                        fontWeight: FontWeight.bold))),
          ],
        ),
        SizedBox(height: 5),
        Container(
          height: 200,
          margin: EdgeInsets.all(20),
          child: ListView(physics: NeverScrollableScrollPhysics(), children: [
            Row(
              children: [
                Container(
                  width: 100,
                  child: Text(
                    "Họ và tên: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Text(
                  "Đỗ Dương Tâm Đăng",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: Text(
                    "Địa chỉ: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                  width: 250,
                  child: Text(
                    "Chung cư Sky9, đường Liên Phường, phường Phú Hữu, TP. Thủ Đức, TP.HCM.",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: Text(
                    "Điện thoại: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                  width: 100,
                  child: Text(
                    "0774839222",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimaryColor, kPrimaryLightColor],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                child: Text(
                  'Edit Profile',
                  style:
                      TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
          ]),
        )
      ],
    );
  }
}
