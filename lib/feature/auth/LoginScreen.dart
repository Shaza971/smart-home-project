import 'package:flutter/material.dart';
import 'package:smart_home/cores/utils/app_colors.dart';
import 'package:smart_home/cores/widgets/app-button.dart';
import 'package:smart_home/feature/auth/signupScreen.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.maincolor,
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            Text('welcom back',style: TextStyle(fontSize: 12)),
            Text('sign in to your home' ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text('Email address:'),
          SizedBox(height: 15),
          datafield('Email'),
          SizedBox(height: 15),
          Text('Password:'),
          datafield("Password"),
          SizedBox(height: 15),
          forgotpassword(),
           SizedBox(height: 15),
          AppButton(buttonname: 'log in'),
           SizedBox(height: 15),
         Text('-----------------------or continue with--------------------'), 
          SizedBox(height: 15),
         donthaveacount(context),
          SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          button('google'),
          SizedBox(width: 20,),
          button('apple'),
          ]
        ),
        ],
      ),
    );
  }

/////////////////////// Widgets Mehods ///////////////////
Widget datafield(String lable) {
  return Container(
   
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: TextField(
      decoration: InputDecoration(
        labelText: lable,
        border: const OutlineInputBorder(),
       
      )
    ),
  );
}
Widget forgotpassword()
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GestureDetector(
        child: Text('Forgot Password?'),
      ),
    ],
  );
}
  Widget donthaveacount(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('dont have acount?  '),
        GestureDetector(
          child: Text('sign up'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signupscreen()),
            );
          },
        )
      ],
    );
  }
  

  Widget button(String name)
  {
     return GestureDetector(
      onTap: null,
      child: Container(
        decoration: BoxDecoration(
          color:  Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 70,
        width: 160,
        child: Center(child: Text(name)),
      ),
    );
  }
}