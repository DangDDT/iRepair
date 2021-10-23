import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/Screens/Client/BookService/map/widgets/comment.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';
import 'package:intl/intl.dart';

List _elements = [
  {
    'id': 'A002',
    'majorModel': 'Máy lạnh',
    'brand': 'Panasonic',
    'problem': 'Bị chảy nước',
    'repairman': 'Trần Văn Thái',
    'group': 'Đã xử lý',
    'status': 'Đã hoàn thành',
    'createdAt': '12-08-2020'
  },
  {
    'id': 'A007',
    'majorModel': 'Ống nước',
    'brand': 'Khác',
    'problem': "Nghẹt ống cống nhà tắm",
    'repairman': 'Đỗ Thành Thái',
    'group': 'Đã xử lý',
    'status': 'Đã hủy',
    'createdAt': '19-08-2020'
  },
  {
    'id': 'A040',
    'majorModel': 'Máy lạnh',
    'brand': 'Panasonic',
    'problem': 'Bị chảy nước',
    'repairman': 'Trần Văn Thái',
    'group': 'Đã xử lý',
    'status': 'Đã hoàn thành',
    'createdAt': '30-10-2020'
  },
  {
    'id': 'A078',
    'majorModel': 'Máy lạnh',
    'brand': 'Panasonic',
    'problem': 'Bị chảy nước',
    'repairman': 'Trần Văn Thái',
    'group': 'Đã xử lý',
    'status': 'Đã hủy',
    'createdAt': '13-02-2021'
  },
  {
    'id': 'A084',
    'majorModel': 'Ống nước',
    'brand': 'Khác',
    'problem': "Nghẹt ống cống nhà tắm",
    'repairman': 'Đỗ Thành Thái',
    'group': 'Đã xử lý',
    'status': 'Đã hoàn thành',
    'createdAt': '12-04-2021'
  },
  {
    'id': 'A123',
    'majorModel': 'Tủ lạnh',
    'brand': 'Panasonic',
    'repairman': 'Phạm Hữu Nghĩa',
    'problem': 'Bị chảy nước',
    'group': 'Đang xử lý',
    'status': 'Thợ đang đến',
    'createdAt': '30-09-2021'
  },
];

class HistoryBookingScreen extends StatefulWidget {
  const HistoryBookingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HistoryBookingScreenState createState() => _HistoryBookingScreenState();
}

class _HistoryBookingScreenState extends State<HistoryBookingScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    refreshList();
    _scaffoldKey = GlobalKey();
    super.initState();
  }

  Future<List> refreshList() async {
    setState(() => {_elements});
    return _elements;
  }

  @override
  void dispose() {
    // disposing states
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
          key: null,
          appBar: AppBar(),
          title: 'Lịch sử yêu cầu',
          haveBackSpace: true),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
            () => {
              /// adding elements in list after [1 seconds] delay
              /// to mimic network call
              ///
              /// Remember: [setState] is necessary so that
              /// build method will run again otherwise
              /// list will not show all elements
              refreshList()
              // showing snackbar
            },
          );
        },
        child: GroupedListView<dynamic, String>(
          physics: const AlwaysScrollableScrollPhysics(),
          elements: _elements,
          groupBy: (element) => element['group'],
          groupComparator: (value1, value2) => value1.compareTo(value2),
          itemComparator: (item1, item2) => DateFormat('dd-MM-yyyy')
              .parse(item2['createdAt'])
              .compareTo(DateFormat('dd-MM-yyyy').parse(item1['createdAt'])),
          order: GroupedListOrder.ASC,
          // useStickyGroupSeparators: true,
          groupSeparatorBuilder: (String value) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          itemBuilder: (c, element) {
            return Card(
              elevation: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                child: ListTile(
                  trailing: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35)),
                      child: InkWell(
                          onTap: () => {
                                (element['group'] == 'Đang xử lý')
                                    ? Get.toNamed("/map")
                                    : showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('CHI TIẾT YÊU CẦU',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            content: Container(
                                              height: 350,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Divider(
                                                    height: 30,
                                                    thickness: 1,
                                                    indent: 0,
                                                    endIndent: 0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Đồ cần sửa:  '),
                                                      Text(
                                                          element['majorModel'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Hãng:  '),
                                                      Text(element['brand'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Vấn đề:  '),
                                                      Text(element['problem'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  Divider(
                                                    height: 30,
                                                    thickness: 1,
                                                    indent: 0,
                                                    endIndent: 0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Thợ: '),
                                                      Text(element['repairman'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            child: Image.network(
                                                                "https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/145490152_1645861872468232_2404576525271328519_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=-KKRXEcThkEAX-VQeMP&_nc_ht=scontent.fsgn5-8.fna&oh=5dfe93870e948990400b19eafa9ebd6e&oe=6183DEBC",
                                                                height: 70,
                                                                width: 70),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                color:
                                                                    kSecondaryColor,
                                                                size: 14,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                color:
                                                                    kSecondaryColor,
                                                                size: 14,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                color:
                                                                    kSecondaryColor,
                                                                size: 14,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                color:
                                                                    kSecondaryColor,
                                                                size: 14,
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                color:
                                                                    Colors.grey,
                                                                size: 14,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    height: 20,
                                                    thickness: 1,
                                                    indent: 0,
                                                    endIndent: 0,
                                                  ),
                                                  (element["status"] ==
                                                          "Đã hoàn thành")
                                                      ? Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    'Đánh giá yêu cầu: '),
                                                                Text(
                                                                    'Hài lòng ',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star,
                                                                      color:
                                                                          kSecondaryColor,
                                                                      size: 14,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star,
                                                                      color:
                                                                          kSecondaryColor,
                                                                      size: 14,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star,
                                                                      color:
                                                                          kSecondaryColor,
                                                                      size: 14,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star,
                                                                      color:
                                                                          kSecondaryColor,
                                                                      size: 14,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .grey,
                                                                      size: 14,
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    'Phản hồi chi tiết: '),
                                                                Text(
                                                                    'Thợ đẹp trai, nhiệt tình',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            Text('Lý do hủy: '),
                                                            Text(
                                                                'Không liên hệ được thợ ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          ],
                                                        ),
                                                  Row(
                                                    children: [
                                                      Text('Ngày tạo:  '),
                                                      Text(element['createdAt'],
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Trạng thái: '),
                                                      Text(
                                                        element['status'],
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: (element[
                                                                        'group'] ==
                                                                    'Đang xử lý')
                                                                ? CupertinoColors
                                                                    .activeOrange
                                                                : (element['status'] ==
                                                                        'Đã hoàn thành')
                                                                    ? CupertinoColors
                                                                        .activeGreen
                                                                    : CupertinoColors
                                                                        .systemRed,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text('Đóng')),
                                            ],
                                          );
                                        })
                              },
                          child: Icon(
                            Icons.arrow_right,
                          ))),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Column(
                    children: [
                      Icon(CupertinoIcons.bookmark_solid,
                          color: (element['group'] == 'Đang xử lý')
                              ? CupertinoColors.activeOrange
                              : (element['status'] == 'Đã hoàn thành')
                                  ? CupertinoColors.activeGreen
                                  : CupertinoColors.systemRed),
                      SizedBox(height: 10.0),
                      Text(element['createdAt'], style: TextStyle(fontSize: 12))
                    ],
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Đồ cần sửa:  '),
                          Text(element['majorModel'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Thợ: '),
                          Text(element['repairman'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Trạng thái: '),
                          Text(
                            element['status'],
                            style: TextStyle(
                                fontSize: 16,
                                color: (element['group'] == 'Đang xử lý')
                                    ? CupertinoColors.activeOrange
                                    : (element['status'] == 'Đã hoàn thành')
                                        ? CupertinoColors.activeGreen
                                        : CupertinoColors.systemRed,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
