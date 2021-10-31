import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/userController/userController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Profile/userProfile.dart';
import 'package:i_repair/Services/auth/auth.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);
  final UserProfile? user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //TextController
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();

  @override
  void initState() {
    _nameController.text = '';
    _phoneController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthService>(context);
    final userBloc = Provider.of<UserBloc>(context);

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
                          Text("Thông tin cá nhân",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
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
                            await userBloc.logout();
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
        (widget.user!.avatar != 'none')
            ? ClipRRect(
                child: Image.network(
                  widget.user!.avatar,
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
        Container(
          height: 200,
          margin: EdgeInsets.all(20),
          child: ListView(physics: NeverScrollableScrollPhysics(), children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 100,
                    child: Text(
                      "Họ và tên: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    width: 210,
                    child: Text(
                      widget.user!.fullName,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      color: Colors.white,
                      minWidth: 2,
                      elevation: 0,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              final _formKey = GlobalKey<FormState>();
                              var focusNode = FocusNode();
                              return AlertDialog(
                                title: Text('Chỉnh sửa họ và tên'),
                                content: Container(
                                  width: 300,
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      focusNode: focusNode,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        labelText: 'Họ và tên',
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                      controller: _nameController,
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text('Đóng')),
                                  TextButton(
                                      onPressed: () {
                                        userBloc.setCurrentUserProfile(
                                            "FULLNAME",
                                            _nameController.text,
                                            null,
                                            null);
                                        Get.back();
                                      },
                                      child: Text('Lưu')),
                                ],
                              );
                            });
                      },
                      child: Icon(
                        Icons.edit,
                        color: kTextColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              indent: 5,
              endIndent: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 100,
                    child: Text(
                      "Địa chỉ: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    width: 210,
                    child: Text(
                      // CHƯA CÓ ĐỊA CHỈ TRONG API
                      (widget.user!.address == null)
                          ? '< Chưa có địa chỉ >'
                          : '${widget.user!.address}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      color: Colors.white,
                      elevation: 0,
                      minWidth: 2,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      onPressed: () {
                        Get.toNamed("/choose_address");
                      },
                      child: Icon(
                        Icons.edit,
                        color: kTextColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 10,
              thickness: 1,
              indent: 5,
              endIndent: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 100,
                    child: Text(
                      "Điện thoại: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    width: 210,
                    child: Text(
                      (widget.user!.phoneNumber != null)
                          ? widget.user!.phoneNumber
                          : 'Chưa có số điện thoại',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      elevation: 0,
                      color: Colors.white,
                      minWidth: 2,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              final _formKey = GlobalKey<FormState>();
                              var focusNode = FocusNode();
                              return AlertDialog(
                                title: Text('Chỉnh sửa số điện thoại'),
                                content: Container(
                                  width: 300,
                                  child: Form(
                                    key: _formKey,
                                    child: TextFormField(
                                      focusNode: focusNode,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        labelText: 'Số điện thoại',
                                        prefixIcon: Icon(Icons.phone),
                                      ),
                                      controller: _phoneController,
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text('Đóng')),
                                  TextButton(
                                      onPressed: () {
                                        userBloc.setCurrentUserProfile(
                                            "PHONE_NUMBER",
                                            _phoneController.text,
                                            null,
                                            null);
                                        Get.back();
                                      },
                                      child: Text('Lưu')),
                                ],
                              );
                            });
                      },
                      child: Icon(
                        Icons.edit,
                        color: kTextColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
