// import 'package:get/get.dart';
// import 'package:i_repair/Models/Field/field.dart';
// import 'package:i_repair/Models/Service/service.dart';
// import 'package:i_repair/Services/api.services.dart';

// class ServiceController extends GetxController {
//   var isLoading = true.obs;
//   var serviceList;

//   void getServicesByField(Field field, double lat, double lng) async {
//     try {
//       isLoading(true);
//       var services =
//           await APIServices.get(field, lat, lng);
//       serviceList.assignAll(services);
//       print("getServicesByField() success");
//     } finally {
//       isLoading(false);
//     }
//   }
// }
