import 'package:final_app/screens/authanticate/authicate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './home/home.dart';
import '../model/user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    if(user== null){
      return Authanticate();
    }else{
      return Home();
    }
  }
}