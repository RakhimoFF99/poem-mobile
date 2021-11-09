import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final title;
 CustomCard({this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width/1.2,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff823AA0)
      ),
      child: Center(
        child: Text(
          title.toString(),
          style: TextStyle(
            fontSize: size.width/25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
