import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';

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
                      child: Icon(CupertinoIcons.profile_circled,
                          size: 50, color: kBackgroundColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Đỗ Dương Tâm Đăng',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: kBackgroundColor)),
                          Text('0774839222',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  letterSpacing: 0.5,
                                  color: kBackgroundColor)),
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
                            onTap: () => {Get.offAllNamed("/")},
                            child: Icon(Icons.logout)))
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
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/avatar.jpg",
                height: 150,
                width: 150,
              ),
            ),
          ),
          // Icon(CupertinoIcons.profile_circled, size: 120),
        ),
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
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              Container(
                child: Text('Họ và tên: ',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Container(child: Text('Đỗ Dương Tâm Đăng'))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              Container(
                child: Text('Địa chỉ: ',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Container(
                  child: Text(
                      'Chung cư Sky9, Liên Phường, Phú Hữu, TP.Thủ Đức, TP.HCM'))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              Container(
                child: Text('Số điện thoại: ',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Container(child: Text('0774839222'))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:
                  Alignment(1, 1), // 10% of the width, so there are ten blinds.
              colors: <Color>[
                kSecondaryLightColor,
                kSecondaryColor,
              ], // red to yellow
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: MaterialButton(
            onPressed: () => {},
            child: Text('Cập nhật thông tin',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
