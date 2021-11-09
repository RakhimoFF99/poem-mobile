import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:p/constants.dart';

class PoemController extends GetxController {
  var poemList = [].obs;
  var isLoading = false.obs;
  
 Future getPoemById (id) async{
   print(id);
   isLoading.value = true;
    http.Response response = await http.get(Uri.parse("$url/category/poem/get/$id"));
    var data = jsonDecode(response.body);
    poemList.value = data['data'];
    isLoading.value = false;
    print(poemList);


 }
  
}