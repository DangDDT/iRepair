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
                          Text('Phạm Hữu Nghĩa',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: kBackgroundColor)),
                          Text('0123456789',
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
              child: Image.network(
                "https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/145490152_1645861872468232_2404576525271328519_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=-KKRXEcThkEAX-VQeMP&_nc_ht=scontent.fsgn5-8.fna&oh=5dfe93870e948990400b19eafa9ebd6e&oe=6183DEBC",
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
              Container(child: Text('Phạm Hữu Nghĩa'))
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
                  child: Text('Sô 4, đường Đinh Tiên Hoàng, quận 11, TP.HCM'))
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
              Container(child: Text('0123456789'))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              Container(
                child: Text('Chuyên môn: ',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Container(child: Text('Kĩ sư điện lạnh, Kĩ sư điện gia dụng.'))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              Container(
                child: Text('Đánh giá: ',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: kSecondaryColor,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: kSecondaryColor,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: kSecondaryColor,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: kSecondaryColor,
                    size: 14,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 14,
                  ),
                ],
              )
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
                kPrimaryLightColor,
                kPrimaryColor,
              ], // red to yellow
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: MaterialButton(
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: AlertDialog(
                        title: Text('Cập nhật thông tin'),
                        content: Container(
                          height: 270,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Họ và tên : "),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 30, right: 30, top: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    hintStyle: TextStyle(color: Colors.grey[800]),
                                    fillColor: Colors.white70,
                                    contentPadding: EdgeInsets.only(left: 15),
                                  ),
                                  initialValue: "Phạm Hữu Nghĩa",
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Địa chỉ : "),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 30, right: 30, top: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    hintStyle: TextStyle(color: Colors.grey[800]),
                                    fillColor: Colors.white70,
                                    contentPadding: EdgeInsets.only(left: 15),
                                  ),
                                  initialValue:
                                      "Sô 4, đường Đinh Tiên Hoàng, quận 11, TP.HCM",
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Số điện thoại : "),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 30, right: 30, top: 10),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintStyle:
                                          TextStyle(color: Colors.grey[800]),
                                      fillColor: Colors.white70,
                                      contentPadding: EdgeInsets.only(left: 15),
                                    ),
                                    initialValue: "0123456789"),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Hủy')),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Cập nhật'),
                          )
                        ],
                      ),
                    );
                  })
            },
            child: Text('Cập nhật thông tin',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
