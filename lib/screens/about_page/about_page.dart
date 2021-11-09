import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     appBar: AppBar(
       backwardsCompatibility: false,
       systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color(0xff823AA0)),
        title: Text("Programma haqqinda mag'lishmat",style: TextStyle(
            fontSize: size.width/23
        ),),
        centerTitle: true,
        backgroundColor: Color(0xff823AA0),
      ),
      backgroundColor: Color(0xff9A59B5),
      body: Center(
        child: Text("Malumotlar xali yuklanmagan tez orada yuklanadi ...",style: TextStyle(
          fontSize: size.width/27,
          fontWeight: FontWeight.w600
        ),),
      ),
    );
  }
}
