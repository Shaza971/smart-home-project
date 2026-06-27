import 'package:flutter/material.dart';

class textfield extends StatefulWidget {
  final String lable;
  const textfield({super.key, required this.lable});

  @override
  State<textfield> createState() => __textfieldState();
}

class __textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
     return Container(
   
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: TextField(
      decoration: InputDecoration(
        labelText: widget.lable,
        border: const OutlineInputBorder(),
       
      )
    ),
  );
  }
}