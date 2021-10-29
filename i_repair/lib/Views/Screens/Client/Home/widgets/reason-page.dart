import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:provider/provider.dart';

final List<String> CancelReason = [
  "Tôi không thể nhận đơn vào lúc này",
  "Tôi không thể liên lạc được với khách",
  "Vấn đề quá sức với khả năng của tôi",
  "Lý do khác",
];

final List<String> PendingReason = [
  "Tôi cần thời gian mua vật tư",
  "Tôi đang ở quá xa với địa chỉ của khách",
  "Tôi cần sự tư vấn từ chuyên gia của công ty",
  "Lý do khác",
];
final type = ["CANCEL", "PENDING"];

class ReasonPage extends StatefulWidget {
  final type;
  const ReasonPage({
    Key? key,
    required this.type,
  }) : super(key: key);
  @override
  _ReasonPageState createState() => _ReasonPageState();
}

class _ReasonPageState extends State<ReasonPage> {
  final _formKey = GlobalKey<FormState>();
  List<String>? listReason;
  String? _reason;
  var focusNode = FocusNode();
  final TextEditingController _reasonController = new TextEditingController();
  final orderId = Get.arguments;
  @override
  void initState() {
    listReason = (widget.type == type[0]) ? CancelReason : PendingReason;
    _reason = listReason![0];
    _reasonController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderDetailBloc>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text((widget.type == type[0])
              ? 'Chọn lý do bạn muốn từ chối yêu cầu'
              : 'Chọn lý do bạn muốn trì hoãn')),
      body: SingleChildScrollView(
        child: Container(
          width: 400,
          height: 500,
          child: Column(
            children: [
              Container(
                height: 230,
                child: ListView.builder(
                  itemCount: listReason!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(listReason![index]),
                      leading: Radio<String>(
                        value: listReason![index],
                        groupValue: _reason,
                        onChanged: (value) => {
                          setState(() => {_reason = value!})
                        },
                      ),
                    );
                  },
                ),
              ),
              if (_reason == listReason!.last)
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập lý do khác';
                        }
                      },
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Lý do khác',
                      ),
                      controller: _reasonController,
                    ),
                  ),
                ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(
                        1, 1), // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      kSecondaryLightColor,
                      kSecondaryColor,
                    ], // red to yellow
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    if (widget.type == type[0]) {
                      if (_reason == listReason!.last &&
                          _formKey.currentState!.validate()) {
                        await orderBloc.cancelOrder(
                            orderId, _reasonController.text);
                        Get.offAndToNamed('/success_screen');
                      } else {
                        await orderBloc.cancelOrder(orderId, _reason!);
                        Get.offAndToNamed('/success_screen');
                      }
                    } else if (widget.type == type[1]) {
                      if (_reason == listReason!.last &&
                          _formKey.currentState!.validate()) {
                        await orderBloc.pendingOrder(
                            orderId, _reasonController.text);
                        Get.offAndToNamed('/success_screen');
                      } else {
                        await orderBloc.pendingOrder(orderId, _reason!);
                        Get.offAndToNamed('/success_screen');
                      }
                    }
                  },
                  child: Text(widget.type == type[0]
                      ? 'XÁC NHẬN HỦY'
                      : 'XÁC NHẬN TRÌ HOÃN'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
