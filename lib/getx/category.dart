import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:p/constants.dart';
class Category extends GetxController {
  var categories = [].obs;
  var categoryList = [].obs;
  var isLoading = false.obs;

    @override
    void onInit() async {
      super.onInit();
      getAllCategory();
    }
 Future getAllCategory () async{

      try {
        http.Response response = await http.get(Uri.parse("$url/category/get"));
        var data = jsonDecode(response.body);
        categories.value = data['categoryList'];
      }
      catch(e) {
        print(e);
      }




 }

  Future getCategoriesById (id) async{
      isLoading.value = false;
    http.Response response = await http.get(Uri.parse("$url/category/get/$id"));
    var data = jsonDecode(response.body);
    categoryList.value = data['data'];
      isLoading.value = true;

  }
}