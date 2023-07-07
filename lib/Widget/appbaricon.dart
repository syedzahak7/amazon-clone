import 'package:flutter/material.dart';
class AppBarIcon extends StatelessWidget {
   AppBarIcon(this.icon,this.text, {super.key});
IconData icon;
String text;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  const EdgeInsets.only(left: 18,bottom: 18,),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 50,
            height: 45,
            child: Material(
                color: const Color.fromARGB(255, 57, 68, 81),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Icon(icon,color: Colors.white,)),
          ),
          Text(text,style:const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}


