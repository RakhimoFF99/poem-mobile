import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:p/getx/poemController.dart';
import 'package:p/screens/components/customCard.dart';
import 'package:p/getx/category.dart';
import 'package:p/screens/poem_list/poem_list.dart';

class CategoryPage extends StatelessWidget {
  final title;
  final data;
  CategoryPage({this.title,this.data});

  var category = Get.put(Category());
  var poemController = Get.put(PoemController());

  @override
  Widget build(BuildContext context) {
    print(data);
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

                  ListView.builder(
                       shrinkWrap: true,
                       scrollDirection: Axis.vertical,
                       itemCount: data.length,
                       itemBuilder: (context, index) {
                         return Column(
                           children: [
                             Center(child: GestureDetector(
                               child: GestureDetector(
                                 child: CustomCard(
                                   title:data[index]['name'],),
                               ),
                               onTap: () {
                                    data[index]['children'].length == 0 ? PoemController().getPoemById(data[index]['_id']):null;
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => data[index]['children'].length > 0 ? CategoryPage(title: data[index]['name'],data: data[index]['children']):PoemList(title: data[index]['name'],)));
                               },
                             )),
                             SizedBox(height: 10,),
                           ],
                         );
                       })


          ],
        ),
      ),
    );
  }
}
