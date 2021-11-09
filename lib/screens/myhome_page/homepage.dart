import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:p/constants.dart';
import 'package:p/getx/category.dart';
import 'package:p/screens/about_page/about_page.dart';
import 'package:p/screens/category_page/category_page.dart';
import 'package:p/screens/components/customCard.dart';
import 'package:http/http.dart' as http;
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();


}


class _MyHomePageState extends State<MyHomePage> {
    var category = Get.put(Category());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff9A59B5),
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color(0xff823AA0)),
        title: Text('I.Yusupov poeziyasında folklorizmler',style: TextStyle(
          fontSize: size.width/23
        ),),
        centerTitle: true,
        backgroundColor: Color(0xff823AA0),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(title:"Ápiwayı folklorizmler" ,data: category.categories[0]['children'],)));
                },
                child: CustomCard(title: "Ápiwayı folklorizmler",))
            ),
            SizedBox(height: 10,),
            Center(child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(title: "Quramalı folklorizmler",data: category.categories[1]['children'],)));
                },
                child: CustomCard(title: "Quramalı folklorizmler",))),
            SizedBox(height: 10,),
            Center(child: GestureDetector(
                onTap: () {
                  category.getCategoriesById(category.categories[1]['_id']);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
                },
                child: CustomCard(title: "Programma haqqinda mag'lishmat",)
            ))

          ],
        ),
      ),
    );
  }
}
