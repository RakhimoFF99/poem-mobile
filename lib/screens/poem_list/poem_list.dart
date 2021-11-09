import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:p/getx/category.dart';
import 'package:get/get.dart';
import 'package:p/getx/poemController.dart';
import 'package:p/screens/components/customCard.dart';
class PoemList extends StatelessWidget {
  final title;
    PoemList({this.title});
  var poemController = Get.put(PoemController());

  @override
  Widget build(BuildContext context) {
    print('sdsddsssdsdsddsddsd');
   final Size size = MediaQuery.of(context).size;
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
              init: PoemController(),
              builder: (context) {
                print(poemController.poemList.length);
                if(poemController.isLoading.isFalse) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            // Center(child: GestureDetector(
                            //   child: GestureDetector(
                            //     child: CustomCard(
                            //       title: poemController.poemList[index]['name'],),
                            //   ),
                            //   onTap: () {
                            //
                            //   },
                            // )),
                            Text('sdsds'),
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
