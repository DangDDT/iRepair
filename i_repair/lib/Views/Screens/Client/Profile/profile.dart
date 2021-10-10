import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/User/user.dart';
import 'package:i_repair/Services/auth/auth.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);
  final CurrentUser? user;
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthService>(context);
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Stack(children: [
          Container(
            height: 140,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    1, 1), // 10% of the width, so there are ten blinds.
                colors: <Color>[
                  kPrimaryColor,
                  kPrimaryLightColor,
                  kBackgroundColor
                ], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: Container(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(CupertinoIcons.profile_circled, size: 50),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user!.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          (user!.phoneNumber != null)
                              ? Text(user!.phoneNumber,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      letterSpacing: 0.5))
                              : SizedBox(
                                  height: 0,
                                ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 20),
                        child: MaterialButton(
                          elevation: 5,
                          color: kBackgroundColor,
                          minWidth: 2,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none),
                          onPressed: () async {
                            await loginProvider.logout(context: context);
                            Get.offAllNamed("/");
                          },
                          child: Icon(
                            Icons.exit_to_app,
                            color: kTextColor,
                          ),
                        ),
                      ),
                    )
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
        SizedBox(height: 20),
        (user!.avatar != 'none')
            ? ClipRRect(
                child: Image.network(
                  user!.avatar,
                  height: 140,
                  width: 140,
                  fit: BoxFit.fitHeight,
                ),
              )
            : Center(
                //Logo
                child: Icon(CupertinoIcons.profile_circled, size: 120)),
        SizedBox(height: 20),
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
                label: Text('Cập nhật ảnh',
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
                label: Text('Xóa ảnh',
                    style: TextStyle(
                        color: CupertinoColors.black,
                        fontWeight: FontWeight.bold))),
          ],
        ),
        SizedBox(height: 5),
        Container(
          height: 120,
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
                  user!.name,
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
                    (user!.addressDetail != null)
                        ? user!.addressDetail
                        : 'Chưa có địa chỉ',
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
                  width: 150,
                  child: Text(
                    (user!.phoneNumber != null)
                        ? user!.phoneNumber
                        : 'Chưa có số điện thoại',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ]),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
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
              'Cập nhật thông tin',
              style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
