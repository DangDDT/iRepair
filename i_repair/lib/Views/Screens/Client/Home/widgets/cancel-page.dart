import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Views/common/success-screen/success-screen.dart';
import 'package:provider/provider.dart';

final List<String> CancelReason = [
  "Muốn gửi 1 yêu cầu khác",
  "Không liên hệ được thợ",
  "Thời gian chờ thợ đến quá lâu",
  "Lý do khác",
];

class CancelRequestPage extends StatefulWidget {
  @override
  _CancelRequestPageState createState() => _CancelRequestPageState();
}

class _CancelRequestPageState extends State<CancelRequestPage> {
  final _formKey = GlobalKey<FormState>();
  var focusNode = FocusNode();
  final TextEditingController _reasonController = new TextEditingController();
  String _reason = CancelReason[1];
  final orderId = Get.arguments;
  @override
  void initState() {
    _reasonController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderDetailBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Chọn lý do bạn muốn hủy yêu cầu')),
      body: SingleChildScrollView(
        child: Container(
          width: 400,
          height: 500,
          child: Column(
            children: [
              Container(
                height: 230,
                child: ListView.builder(
                  itemCount: CancelReason.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(CancelReason[index]),
                      leading: Radio<String>(
                        value: CancelReason[index],
                        groupValue: _reason,
                        onChanged: (value) => {
                          setState(() => {_reason = value!})
                        },
                      ),
                    );
                  },
                ),
              ),
              if (_reason == CancelReason[3])
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
                    if (_reason == CancelReason[3] &&
                        _formKey.currentState!.validate()) {
                      await orderBloc.cancelOrder(
                          orderId, _reasonController.text);
                      Get.to(() => SuccessScreen());
                    } else {
                      await orderBloc.cancelOrder(orderId, _reason);
                      Get.to(() => SuccessScreen());
                    }
                  },
                  child: Text('XÁC NHẬN HỦY'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
