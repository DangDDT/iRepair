import 'dart:async';

import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/fieldController/fieldController.dart';
import 'package:i_repair/Controllers/majorController/majorController.dart';
import 'package:i_repair/Controllers/placeController/placeController.dart';
import 'package:i_repair/Controllers/serviceController/serviceController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Models/Major/major.dart';
import 'package:i_repair/Models/Service/service.dart';
import 'package:i_repair/Models/User/user.dart';
import 'package:i_repair/Views/Screens/Client/CreateBooking/widgets/debounce.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //TextController
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  late bool useDefaultProfile;

  //Stepper
  int upperBound = 4;
  int activeStep = 0;

  //Paymentf
  Payment? _payment = Payment.COD;

  //CurentUser
  CurrentUser? user;

  var focusNode = FocusNode();
  @override
  void initState() {
    useDefaultProfile = false;
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
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    checkCompleteIcon(activeStep, 2, Icon(Icons.person)),
                    checkCompleteIcon(activeStep, 3, Icon(Icons.payment)),
                    checkCompleteIcon(activeStep, 4, Icon(Icons.check_circle)),
                  ],
                  lineLength: 26.5,
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
                      left: 21,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 12,
                    ),
                    children: [
                      Text('Đồ dùng'),
                      Text(' Dịch vụ'),
                      Text('Thông tin'),
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
                    if (activeStep == 2)
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
                    if (activeStep == 3)
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
                    if (activeStep == 4)
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
  Field? selectedField;

  //Display
  List<Service> displayServiceList = [];

  void _openFilterDialog() async {
    await FilterListDialog.display<Major>(
      context,
      allButtonText: 'Tất cả',
      resetButtonText: 'Mặc định',
      applyButtonText: 'Lọc',
      applyButonTextBackgroundColor: kSecondaryLightColor,
      selectedTextBackgroundColor: kSecondaryLightColor,
      selectedItemsText: 'lĩnh vực được chọn',
      listData: majorController.majorList,
      selectedListData: selectedMajorList,
      height: 480,
      headlineText: "Lĩnh vực",
      searchFieldHintText: "Tìm lĩnh vực",
      choiceChipLabel: (item) {
        return item!.name;
      },
      validateSelectedItem: (list, val) {
        return list!.contains(val);
      },
      onItemSearch: (list, text) {
        if (list != null) {
          if (list.any((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))) {
            /// return list which contains matches
            return list
                .where((element) =>
                    element.name.toLowerCase().contains(text.toLowerCase()))
                .toList();
          }
        }

        return [];
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedMajorList = List.from(list!);
          if (selectedMajorList!.isEmpty) {
            fieldController.fetchFields();
          } else {
            fieldController.getFieldsByMajors(selectedMajorList!);
          }
        });
        Navigator.pop(context);
      },
    );
  }

  Widget bodyWidget(value) {
    switch (value) {
      case 0:
        return Obx(() {
          return Column(children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: MaterialButton(
                  onPressed: _openFilterDialog,
                  child: Text('Lọc theo lĩnh vực'),
                  color: kBackgroundColor,
                  elevation: 5,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(width: 2))),
            ),
            Expanded(
                child: SizedBox(
              height: 250,
              child: (fieldController.isLoading.isTrue)
                  ? Center(child: CircularProgressIndicator())
                  : (fieldController.fieldList.length == 0 &&
                          fieldController.isLoading.isFalse)
                      ? Center(child: Text('No field with this major'))
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            final placeBloc = Provider.of<PlaceBloc>(context);
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
                                            placeBloc.selectedPlace!.geometry
                                                .location.lat,
                                            placeBloc.selectedPlace!.geometry
                                                .location.lng);
                                      });
                                      if (_formKey.currentState!.validate()) {
                                        nextButton();
                                      }
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
                                                child: (fieldController
                                                            .fieldList[index]
                                                            .imageUrl ==
                                                        'none')
                                                    ? SvgPicture.asset(
                                                        'assets/images/default-icon.svg',
                                                        height: 50,
                                                      )
                                                    : Image.network(
                                                        fieldController
                                                            .fieldList[index]
                                                            .imageUrl!,
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
                                                fieldController
                                                    .fieldList[index].name,
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
                                        selectedService = serviceController
                                            .serviceList[index];
                                      });
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
                                          margin: EdgeInsets.only(left: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                serviceController
                                                    .serviceList[index]
                                                    .serviceName,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
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
        print(_nameController.text);
        print(_addressController.text);
        print(_phoneController.text);
        return Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(5),
            child: ListView(children: [
              (useDefaultProfile && user!.name != null)
                  ? TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Họ và tên',
                      ),
                      initialValue: _nameController.text,
                      enabled: !useDefaultProfile,
                    )
                  : TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Họ và tên',
                      ),
                      controller: _nameController,
                      enabled: (!useDefaultProfile || user!.name == null),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập họ và tên';
                        }
                        return null;
                      },
                    ),
              SizedBox(
                height: 30,
              ),
              (useDefaultProfile && user!.phoneNumber != null)
                  ? TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Số điện thoại',
                      ),
                      initialValue: _phoneController.text,
                      enabled: !useDefaultProfile)
                  : TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Số điện thoại',
                      ),
                      controller: _phoneController,
                      enabled:
                          (!useDefaultProfile || user!.phoneNumber == null),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập số điện thoại';
                        }
                        return null;
                      },
                    ),
              Container(
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  title: Text("Dùng thông tin tài khoản"),
                  value: useDefaultProfile,
                  onChanged: (newValue) {
                    setState(() {
                      useDefaultProfile = newValue!;
                      _nameController.text =
                          (useDefaultProfile) ? user!.name : '';
                      _phoneController.text =
                          (useDefaultProfile) ? user!.phoneNumber : '';
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ),
            ]),
          ),
        );
      case 3:
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
      case 4:
        return Container();
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
        return 'Vui lòng điền thông tin của bạn';

      case 3:
        return 'Mời bạn chọn phương thức thanh toán';

      case 4:
        return 'Mời bạn xác nhận thông tin đơn hàng';

      default:
        return 'Chọn vật dụng bạn muốn sửa chữa';
    }
  }
}
