import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/fieldController/fieldController.dart';
import 'package:i_repair/Controllers/majorController/majorController.dart';
import 'package:i_repair/Controllers/orderController/orderController.dart';
import 'package:i_repair/Controllers/placeController/placeController.dart';
import 'package:i_repair/Controllers/serviceController/serviceController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Field/field.dart' as field;
import 'package:i_repair/Models/Major/major.dart';
import 'package:i_repair/Models/Order/order.dart';
import 'package:i_repair/Models/Service/service.dart';
import 'package:i_repair/Models/User/user.dart';
import 'package:i_repair/Views/Screens/Client/CreateBooking/widgets/debounce.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

const kGoogleApiKey = "AIzaSyBkE1pdgaevKBiWqziMQiHfpTp36lU1w68";
enum Payment { COD, BANKING }

class CreateBookingScreen extends StatefulWidget {
  @override
  _CreateBookingScreenState createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {
  //Controller
  MajorController majorController = Get.put(MajorController());
  ServiceController serviceController = Get.put(ServiceController());
  FieldController fieldController = Get.put(FieldController());

  //Arguments
  final Major data = Get.arguments;

  //TextController
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = new TextEditingController();
  late bool useDefaultProfile;

  //Stepper
  int upperBound = 3;
  int activeStep = 0;

  //Paymentf
  Payment? _payment = Payment.COD;

  //CurentUser
  CurrentUser? user;

  var focusNode = FocusNode();
  @override
  void initState() {
    useDefaultProfile = false;
    print(data.id);
    fieldController.getFieldsByMajors(data);
    getCurrentUser();
    super.initState();
  }

  //Debounce help delay searching

  Icon checkCompleteIcon(currentIndex, valueIndex, indexIcon) {
    if (currentIndex > valueIndex) {
      return Icon(
        Icons.check,
        color: CupertinoColors.activeGreen,
      );
    } else {
      return indexIcon;
    }
  }

  getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final currentUserString = prefs.getString('currentUser') ?? null;
    setState(() {
      user = userFromJson(currentUserString!);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderDetailBloc>(context);
    final placeBloc = Provider.of<PlaceBloc>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Tạo yêu cầu',
        haveBackSpace: true,
        appBar: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Stack(children: [
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                      focusNode: focusNode,
                      autofocus: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập địa chỉ';
                        }
                        if (placeBloc.selectedPlace == null) {
                          return 'Địa chỉ của bạn không tồn tại';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        labelText: 'Địa chỉ',
                        prefixIcon: Icon(CupertinoIcons.location),
                        suffixIcon: Icon(CupertinoIcons.search),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      controller: _addressController,
                      enabled: (activeStep == 0),
                      onChanged: (value) => {
                            new Debouncer().debounce(() {
                              placeBloc.searchPlaces(value);
                            })
                          }),
                ),
                IconStepper(
                  icons: [
                    checkCompleteIcon(
                        activeStep, 0, Icon(CupertinoIcons.wrench_fill)),
                    checkCompleteIcon(
                        activeStep, 1, Icon(Icons.home_repair_service)),
                    checkCompleteIcon(activeStep, 2, Icon(Icons.payment)),
                    checkCompleteIcon(activeStep, 3, Icon(Icons.check_circle)),
                  ],
                  lineLength: 50,
                  scrollingDisabled: true,
                  enableStepTapping: false,
                  enableNextPreviousButtons: false,
                  lineDotRadius: 1.2,
                  activeStepColor: kSecondaryLightColor,
                  stepColor: kBackgroundColor,
                  lineColor: kTextColor,
                  stepRadius: 26,
                  activeStepBorderWidth: 0,
                  activeStepBorderPadding: 0,
                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,
                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
                Container(
                  height: 20,
                  width: size.width,
                  child: GridView(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 27,
                    ),
                    children: [
                      Text('Thiết bị'),
                      Text(' Dịch vụ'),
                      Text('Thanh toán'),
                      Text('  Chốt đơn'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                header(),
                SizedBox(height: 10),
                Expanded(
                  child: Center(
                    child: bodyWidget(activeStep),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (activeStep != 0) previousButton(),
                    if (activeStep == 1)
                      MaterialButton(
                        color: kSecondaryLightColor,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide.none),
                        onPressed: () {
                          // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.

                          if (activeStep > 0
                              // && _formKey.currentState!.validate()
                              ) {
                            nextButton();
                          }
                        },
                        child: Text('Tiếp theo'),
                      ),
                    if (activeStep == 2)
                      MaterialButton(
                        color: kSecondaryLightColor,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide.none),
                        onPressed: () {
                          // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
                          if (activeStep > 0) {
                            nextButton();
                          }
                        },
                        child: Text('Tiếp theo'),
                      ),
                    if (activeStep == 3)
                      MaterialButton(
                        color: kSecondaryLightColor,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide.none),
                        onPressed: () {
                          // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
                          if (activeStep > 0) {
                            // orderBloc.createOrder(new Order(
                            //     serviceId: selectedService!.id,
                            //     customerId: user!.id,
                            //     total: selectedService.price,
                            //     customerAddress: placeBloc.selectedPlace!.name +
                            //         ', ' +
                            //         placeBloc.selectedPlace!.addressDetail,
                            //     lng: placeBloc
                            //         .selectedPlace!.geometry.location.lng,
                            //     lat: placeBloc
                            //         .selectedPlace!.geometry.location.lat));
                            // nextButton();
                          }
                        },
                        child: Text('Chốt đơn'),
                      ),
                  ],
                ),
              ],
            ),
            if (placeBloc.searchResults.length != 0 &&
                focusNode.hasFocus == true)
              Container(
                margin: EdgeInsets.only(top: 55),
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.lighten,
                    color: Colors.white),
              ),
            if (placeBloc.searchResults.length != 0 &&
                focusNode.hasFocus == true)
              Container(
                  margin: EdgeInsets.only(top: 55),
                  height: 500,
                  child: ListView.builder(
                      itemCount: placeBloc.searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 0.2)),
                              ),
                              child: InkWell(
                                onTap: () => {
                                  placeBloc.setSelectedPlace(placeBloc
                                      .searchResults[index].placeId
                                      .trim()),
                                  focusNode.unfocus(),
                                  _addressController.text =
                                      placeBloc.searchResults[index].description
                                },
                                child: Text(
                                    placeBloc.searchResults[index].description),
                              )),
                        );
                      }))
          ]),
        ),
      ),
    );
  }

  void nextButton() {
    if (activeStep < upperBound) {
      setState(() {
        activeStep++;
      });
    } else {
      Get.offNamed("/success_screen");
    }
  }

  /// Returns the previous button.
  Widget previousButton() {
    return MaterialButton(
      color: kSecondaryLightColor,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35), borderSide: BorderSide.none),
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Quay lại'),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            headerText(),
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  //Selected
  List<Major>? selectedMajorList = List<Major>.empty().obs;
  Service? selectedService;
  field.Field? selectedField;

  //Display

  Widget bodyWidget(value) {
    switch (value) {
      case 0:
        return Obx(() {
          return Column(children: [
            Expanded(
                child: SizedBox(
              height: 250,
              child: (fieldController.isLoading.isTrue)
                  ? Center(child: CircularProgressIndicator())
                  : (fieldController.fieldList.length == 0 &&
                          fieldController.isLoading.isFalse)
                      ? Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: Center(
                              child: Column(
                            children: [
                              Container(
                                  child: ClipRRect(
                                child: Image.asset(
                                  "assets/images/handyman.png",
                                  height: 50,
                                  width: 50,
                                ),
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  child: Text(
                                      'Chưa có thiết bị cho lĩnh vực này !!!')),
                            ],
                          )),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            final field = fieldController.fieldList[index];
                            return Container(
                              height: 100,
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25)),
                                elevation: 5,
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedField =
                                            fieldController.fieldList[index];
                                        serviceController.getServicesByField(
                                          selectedField!,
                                        );
                                      });
                                      print(selectedField!.id);
                                      nextButton();
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          margin: EdgeInsets.only(left: 20),
                                          decoration: BoxDecoration(
                                              color: kSecondaryLightColor,
                                              borderRadius:
                                                  BorderRadius.circular(34)),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 5,
                                                child:
                                                    (field.imageUrl == 'none')
                                                        ? SvgPicture.asset(
                                                            'assets/images/default-icon.svg',
                                                            height: 50,
                                                          )
                                                        : Image.network(
                                                            field.imageUrl,
                                                            height: 50,
                                                          ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                field.name,
                                                style: TextStyle(fontSize: 24),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          },
                          itemCount: fieldController.fieldList.length,
                          separatorBuilder: (context, index) => Divider(),
                        ),
            ))
          ]);
        });
      case 1:
        return Obx(() {
          return Column(children: [
            Expanded(
                child: SizedBox(
              height: 250,
              child: (serviceController.isLoading.isTrue)
                  ? Center(child: CircularProgressIndicator())
                  : (serviceController.serviceList.length == 0 &&
                          serviceController.isLoading.isFalse)
                      ? Center(child: Text('No service with this major'))
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            final Service service =
                                serviceController.serviceList[index];
                            return Container(
                              height: 250,
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25)),
                                elevation: 5,
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedService = service;
                                      });
                                      nextButton();
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              margin: EdgeInsets.only(
                                                  top: 25, left: 20),
                                              decoration: BoxDecoration(
                                                  color: kSecondaryLightColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          34)),
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    left: 10,
                                                    child: SvgPicture.asset(
                                                      'assets/images/default-icon.svg',
                                                      height: 50,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          "Tên dịch vụ: ",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          service.serviceName,
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                            );
                          },
                          itemCount: serviceController.serviceList.length,
                          separatorBuilder: (context, index) => Divider(),
                        ),
            ))
          ]);
        });
      case 2:
        // print(_payment);
        return Container(
          child: Column(
            children: [
              ListTile(
                title: const Text('Thanh toán tại nhà'),
                leading: Radio<Payment>(
                  value: Payment.COD,
                  groupValue: _payment,
                  onChanged: (Payment? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title:
                    const Text('Chuyển khoản qua ngân hàng (Đang phát triển)'),
                leading: Radio<Payment>(
                  value: Payment.BANKING,
                  groupValue: _payment,
                  onChanged: (Payment? value) {
                    // setState(() {
                    //   _payment = value;
                    // });
                  },
                  fillColor: MaterialStateProperty.all(Colors.grey),
                ),
                enabled: false,
              ),
            ],
          ),
        );
      case 3:
        final placeBloc = Provider.of<PlaceBloc>(context);
        return Container(
          height: 400,
          child: Card(
            shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25)),
            elevation: 5,
            child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 20, right: 10, bottom: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  "Tên người đặt: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  user!.name,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  "Số điện thoại: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  user!.phoneNumber,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Địa chỉ sửa: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: 270,
                                child: Text(
                                  "${placeBloc.selectedPlace!.name + ', ' + placeBloc.selectedPlace!.addressDetail}",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(top: 10, left: 20),
                          decoration: BoxDecoration(
                              color: kSecondaryLightColor,
                              borderRadius: BorderRadius.circular(34)),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 10,
                                child: SvgPicture.asset(
                                  'assets/images/default-icon.svg',
                                  height: 50,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "Đồ bạn cần sửa: ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      selectedField!.name,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "Tên dịch vụ: ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      selectedService!.serviceName,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                )),
          ),
        );
      default:
        return Text('$activeStep');
    }
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Chọn dịch vụ bạn mong muốn';

      case 2:
        return 'Mời bạn chọn phương thức thanh toán';

      case 3:
        return 'Mời bạn xác nhận thông tin đơn hàng';

      default:
        return 'Chọn thiết bị bạn muốn sửa chữa';
    }
  }
}
