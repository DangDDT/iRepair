import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/majorController/majorController.dart';
import 'package:i_repair/Controllers/serviceController/serviceController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Models/Major/major.dart';
import 'package:i_repair/Models/Service/service.dart';
import 'package:i_repair/Views/common/appbar/common-appbar.dart';
import 'package:im_stepper/stepper.dart';

class CreateBookingScreen extends StatefulWidget {
  @override
  _CreateBookingScreenState createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {
  int activeStep = 0;

  int upperBound = 4;
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Tạo yêu cầu',
        haveBackSpace: true,
        appBar: AppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            IconStepper(
              stepReachedAnimationEffect: Curves.slowMiddle,
              icons: [
                checkCompleteIcon(
                    activeStep, 0, Icon(CupertinoIcons.wrench_fill)),
                checkCompleteIcon(
                    activeStep, 1, Icon(Icons.home_repair_service)),
                checkCompleteIcon(activeStep, 2, Icon(Icons.person)),
                checkCompleteIcon(activeStep, 3, Icon(Icons.payment)),
              ],
              activeStepBorderColor: kPrimaryLightColor,
              scrollingDisabled: true,
              enableStepTapping: false,
              enableNextPreviousButtons: false,
              lineDotRadius: 3,
              activeStepColor: kPrimaryLightColor,
              stepColor: kBackgroundColor,
              lineColor: kTextColor,
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
              padding: EdgeInsets.only(left: 22),
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                ),
                children: [
                  Text('Chọn đồ dùng'),
                  Text('Chọn dịch vụ'),
                  Text('Điền thông tin'),
                  Text('Thanh toán')
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  void nextButton() {
    if (activeStep < upperBound) {
      setState(() {
        activeStep++;
      });
    }
  }

  /// Returns the previous button.
  Widget previousButton() {
    return MaterialButton(
      color: kPrimaryLightColor,
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

  MajorController majorController = Get.put(MajorController());
  ServiceController serviceController = Get.put(ServiceController());
  List<Field>? fieldList = Field.choices;
  List<Major>? selectedMajorList = [];
  List<Field> displayFieldList = [];
  Field? selectedField;
  List<Service> displayServiceList = [];
  Service? selectedService;
  void _openFilterDialog() async {
    await FilterListDialog.display<Major>(
      context,
      allButtonText: 'Tất cả',
      resetButtonText: 'Mặc định',
      applyButtonText: 'Lọc',
      applyButonTextBackgroundColor: kPrimaryLightColor,
      selectedTextBackgroundColor: kPrimaryLightColor,
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
        });
        Navigator.pop(context);
      },
    );
  }

  Widget bodyWidget(value) {
    switch (value) {
      case 0:
        (selectedMajorList!.length == 0)
            ? displayFieldList = fieldList!
            : displayFieldList = Field.getFieldByMajor(selectedMajorList!);
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
            child: displayFieldList.length == 0
                ? Center(
                    child: Text('No text selected'),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
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
                                  selectedField = displayFieldList[index];
                                });
                                print(selectedField);
                                nextButton();
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    margin: EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                        color: kPrimaryLightColor,
                                        borderRadius:
                                            BorderRadius.circular(34)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 10,
                                          child: SvgPicture.asset(
                                            'assets/images/electric-appliance.svg',
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
                                          displayFieldList[index].name,
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
                    itemCount: displayFieldList.length,
                    separatorBuilder: (context, index) => Divider(),
                  ),
          ))
        ]);
      case 1:
        displayServiceList =
            serviceController.getServicesByField(selectedField!);
        print(displayServiceList);
        return Column(children: [
          Expanded(
              child: SizedBox(
            height: 250,
            child: displayServiceList.length == 0
                ? Center(
                    child: Text('No text selected'),
                  )
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
                                  selectedService = displayServiceList[index];
                                });
                                print(selectedField);
                                nextButton();
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    margin: EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                        color: kPrimaryLightColor,
                                        borderRadius:
                                            BorderRadius.circular(34)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 10,
                                          child: SvgPicture.asset(
                                            'assets/images/electric-appliance.svg',
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
                                          displayServiceList[index]
                                              .serviceName!,
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
                    itemCount: displayServiceList.length,
                    separatorBuilder: (context, index) => Divider(),
                  ),
          ))
        ]);
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
        return 'Cho chúng tôi xin một vài thông tin nhé';

      case 3:
        return 'Mời bạn thanh toán dịch vụ';

      default:
        return 'Chọn vật dụng bạn muốn sửa chữa';
    }
  }
}
