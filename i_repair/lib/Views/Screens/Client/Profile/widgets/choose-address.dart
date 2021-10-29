import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_repair/Controllers/placeController/placeController.dart';
import 'package:i_repair/Controllers/userController/userController.dart';
import 'package:i_repair/Models/Constants/constants.dart';
import 'package:i_repair/Models/Debounce/debounce.dart';
import 'package:i_repair/Models/Place/place_search.dart';
import 'package:i_repair/Services/map_services/places_service.dart';
import 'package:provider/provider.dart';

class ChooseAddressWidget extends StatefulWidget {
  @override
  _ChooseAddressWidgetState createState() => _ChooseAddressWidgetState();
}

class _ChooseAddressWidgetState extends State<ChooseAddressWidget> {
  final _formKey = GlobalKey<FormState>();
  PlaceSearch? _place;

  @override
  void initState() {
    final placeBloc = Provider.of<PlaceBloc>(context, listen: false);
    placeBloc.searchResultsProfile.clear();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final placeBloc = Provider.of<PlaceBloc>(context);
    final userBloc = Provider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cập nhật địa chỉ"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: 400,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'Địa chỉ',
                        prefixIcon: Icon(CupertinoIcons.location),
                      ),
                      onChanged: (value) => {
                        new Debouncer().debounce(() {
                          placeBloc.searchPlacesProfile(value);
                        })
                      },
                    ),
                  ),
                ),
                if (placeBloc.searchResultsProfile.length != 0)
                  Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          width: 400,
                          height: 400,
                          child: ListView.separated(
                            itemCount: placeBloc.searchResultsProfile.length,
                            itemBuilder: (BuildContext context, int index) {
                              PlaceSearch place =
                                  placeBloc.searchResultsProfile[index];
                              return RadioListTile<PlaceSearch>(
                                title: Text(place.description),
                                value: place,
                                groupValue: _place,
                                onChanged: (PlaceSearch? value) {
                                  setState(() {
                                    _place = value;
                                    placeBloc.setSelectedPlaceProfile(
                                        _place!.placeId);
                                  });
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider();
                            },
                          )),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.all(20),
                        child: MaterialButton(
                          color: kSecondaryColor,
                          onPressed: () {
                            final selectAddress =
                                placeBloc.selectedPlaceProfile;
                            userBloc.setCurrentUserProfile(
                                "ADDRESS",
                                "${selectAddress!.name! + ", " + selectAddress.addressDetail!}",
                                selectAddress.geometry.location.lat,
                                selectAddress.geometry.location.lng);
                            Get.back();
                          },
                          child: Text("CẬP NHẬT"),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
