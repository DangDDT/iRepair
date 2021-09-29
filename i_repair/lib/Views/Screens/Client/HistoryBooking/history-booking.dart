import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';
import 'package:intl/intl.dart';

List _elements = [
  {
    'id': 'A002',
    'service': 'Thay gas máy lạnh',
    'repairman': 'Trần Văn Thái',
    'group': 'Lịch sử đơn hàng',
    'status': 'Đã hoàn thành',
    'createdAt': '12-08-2020'
  },
  {
    'id': 'A007',
    'service': 'Thay đường ống nước',
    'repairman': 'Đỗ Thành Thái',
    'group': 'Lịch sử đơn hàng',
    'status': 'Đã hủy',
    'createdAt': '19-08-2020'
  },
  {
    'id': 'A040',
    'service': 'Thay gas máy lạnh',
    'repairman': 'Trần Văn Thái',
    'group': 'Lịch sử đơn hàng',
    'status': 'Đã hoàn thành',
    'createdAt': '30-10-2020'
  },
  {
    'id': 'A078',
    'service': 'Thay gas máy lạnh',
    'repairman': 'Trần Văn Thái',
    'group': 'Lịch sử đơn hàng',
    'status': 'Đã hủy',
    'createdAt': '13-02-2021'
  },
  {
    'id': 'A084',
    'service': 'Thay đường ống nước',
    'repairman': 'Đỗ Thành Thái',
    'group': 'Lịch sử đơn hàng',
    'status': 'Đã hoàn thành',
    'createdAt': '12-04-2021'
  },
  {
    'id': 'A122',
    'service': 'Lắp đặt máy lạnh',
    'repairman': 'Trần Văn Thái',
    'group': 'Đang xử lý',
    'status': 'Thợ đang đến',
    'createdAt': '30-09-2021'
  },
  {
    'id': 'A123',
    'service': 'Sửa nồi cơm',
    'repairman': 'Đang chờ có thợ',
    'group': 'Đang xử lý',
    'status': 'Đang chờ có thợ',
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
          title: 'Lịch sử đơn hàng',
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
          groupComparator: (value1, value2) => value2.compareTo(value1),
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
                      Text(element['service'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
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
