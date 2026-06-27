import 'package:flutter/material.dart';
import 'package:smart_home/cores/widgets/app-button.dart';
import 'package:smart_home/cores/widgets/app_textfield.dart';
class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color(0xff2D4A3E),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Text('welcom back',style: TextStyle(fontSize: 12)),
            Text("create acount",style: TextStyle(fontSize: 17)),
          ],
        ),
      ),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('full name:'),
          SizedBox(height: 15),
          textfield(lable:"full name"),
          SizedBox(height: 15),
          Text('Email:'),
          SizedBox(height: 15),
          textfield(lable:"Email"),
          SizedBox(height: 15),
          Text('password:'),
          SizedBox(height: 15),
          textfield(lable:"Password"),
           SizedBox(height: 15),
           Text('confirm password:'),
           SizedBox(height: 15),
           textfield(lable:"Confirm Password"),
           SizedBox(height: 15),
          terms(
            isChecked: false,
            onChanged: (value) {
              // Handle checkbox state change
            },),
           AppButton(buttonname:'create account'),


        ],
      ),
    )
    );
  }

Widget terms({
  required bool isChecked,
  required ValueChanged<bool?> onChanged,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Checkbox(
        value: isChecked,
        activeColor: Colors.green,
        onChanged: onChanged,
      ),

      Expanded(
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            children: [
              const TextSpan(
                text: 'I agree to the ',
              ),
              TextSpan(
                text: 'Terms of Service',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: ' and ',
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
}