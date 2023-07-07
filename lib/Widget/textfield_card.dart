import 'package:flutter/material.dart';
class TextFieldCard extends StatelessWidget {
  const TextFieldCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
      color:Colors.white,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          IconButton(icon: Icon(Icons.search,color: Colors.black,), onPressed: () {  },),
          const TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: 'Search Products',
              labelStyle:TextStyle(color:Colors.black),

              contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 30),


            ),

          ),
        ],
      ),
    );
  }
}
