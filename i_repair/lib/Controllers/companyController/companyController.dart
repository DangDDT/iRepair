import 'package:get/get.dart';
import 'package:i_repair/Models/Company/company.dart';
import 'package:i_repair/Models/Service/service.dart';
import 'package:i_repair/Services/api.services.dart';

class CompanyController extends GetxController {
  var isLoading = true.obs;
  var companyList = List<Company>.empty().obs;
  Company? selectedCompany;
  @override
  void onInit() {
    super.onInit();
  }

  void getCompanyByServiceAndLocation(
      Service service, double? lat, double? lng) async {
    try {
      isLoading(true);
      if (lat != null && lng != null) {
        var companies =
            await APIServices.fetchCompanyByService(service, lat, lng);
        if (companies != null) {
          companyList.assignAll(companies);
        }
      }
      print("getServicesByField() success");
    } finally {
      isLoading(false);
    }
  }

  void setSelectedCompany(company) {
    selectedCompany = company;
  }
}
