import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:p/screens/components/customCard.dart';
import 'package:p/getx/category.dart';

class CategoryPage extends StatelessWidget {
  final title;
  final data;
  CategoryPage({this.title,this.data});

  var category = Get.put(Category());

  @override
  Widget build(BuildContext context) {
    print(category);
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0xff9A59B5),
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff823AA0)),
        title: Text(title, style: TextStyle(
            fontSize: size.width / 23
        ),),
        centerTitle: true,
        backgroundColor: Color(0xff823AA0),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetX(
              init: Category(),
              builder: (context) {
                 if(category.isLoading.isTrue) {
                  return ListView.builder(
                       shrinkWrap: true,
                       scrollDirection: Axis.vertical,
                       itemCount: category.categoryList.length,
                       itemBuilder: (context, index) {
                         return Column(
                           children: [
                             Center(child: GestureDetector(
                               child: GestureDetector(
                                 child: CustomCard(
                                   title: category.categoryList[index]['name'],),
                               ),
                               onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(title: 'sdsd',data: data,)));
                               },
                             )),
                             SizedBox(height: 10,),
                           ],
                         );
                       });
                 }
                 else {
                  return  Center(child: CircularProgressIndicator(color: Colors.white,));
                 }
              },
            )

          ],
        ),
      ),
    );
  }
}
