import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:final_app/model/user.dart';
import 'package:final_app/screens/wrapper.dart';
import 'package:final_app/service/auth.dart';
import 'package:flutter/material.dart';
import './bloc/listTileColorBloc.dart';
import 'bloc/cartlistBloc.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        //add yours BLoCs controlles
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: StreamProvider<User>.value(
        value: AuthService().user,
              child: MaterialApp(
          title: "Service Mentor",
          home: Wrapper(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}


