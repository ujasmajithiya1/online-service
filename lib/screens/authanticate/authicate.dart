import 'package:final_app/screens/authanticate/register.dart';
import 'package:final_app/screens/authanticate/sign_in.dart';
import 'package:flutter/material.dart';
class Authanticate extends StatefulWidget {
  @override
  _AuthanticateState createState() => _AuthanticateState();
}

class _AuthanticateState extends State<Authanticate> {

  bool showSignIn = true;

  void toggleview(){
    setState(()=> showSignIn= !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleview,);
    }else{
      return Register(toggleView: toggleview);
    }
  }
}