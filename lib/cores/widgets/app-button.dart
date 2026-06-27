import 'package:flutter/material.dart';
import 'package:smart_home/feature/home/home.dart';

class AppButton extends StatefulWidget {
  final String buttonname;
  const AppButton({super.key, required this.buttonname});
  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>Home()),
      
            );
      },
      child: Container(
        decoration: BoxDecoration(
          color:  Color(0xff2D4A3E),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        width: 360,
        child: Center(child: Text(widget.buttonname),),
      ),
    );
  }
  }
