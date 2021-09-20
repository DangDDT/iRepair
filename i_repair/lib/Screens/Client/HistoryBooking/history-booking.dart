import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HistoryBookingScreen extends StatefulWidget {
  const HistoryBookingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HistoryBookingScreenState createState() => _HistoryBookingScreenState();
}

class _HistoryBookingScreenState extends State<HistoryBookingScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List _elements = [
    {'id': 'BK00001', 'name': 'John', 'group': 'Lịch sử đơn hàng'},
    {'id': 'BK00002', 'name': 'Will', 'group': 'Lịch sử đơn hàng'},
    {'id': 'BK00003', 'name': 'Beth', 'group': 'Lịch sử đơn hàng'},
    {'id': 'BK00004', 'name': 'Miranda', 'group': 'Lịch sử đơn hàng'},
    {'id': 'BK00005', 'name': 'Mike', 'group': 'Lịch sử đơn hàng'},
    {'id': 'BK00006', 'name': 'Danny', 'group': 'Đang xử lý'},
  ];
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
    return RefreshIndicator(
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
        itemComparator: (item1, item2) => item1['id'].compareTo(item2['id']),
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
                leading: Icon(CupertinoIcons.bookmark_solid,
                    color: CupertinoColors.activeOrange),
                title: Container(child: Text(element['name'])),
                trailing: Icon(CupertinoIcons.arrow_right),
              ),
            ),
          );
        },
      ),
    );
  }
}
