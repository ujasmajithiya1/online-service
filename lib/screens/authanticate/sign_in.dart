import 'package:final_app/const/loading.dart';
import 'package:final_app/service/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
   final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email= '';
  String password= '';
  String error= '';
  bool loading = false;

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        elevation: 0.0,
        title: Text('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow[800],width: 2.0)
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow[800],width: 2.0)
                  ),
                ),
                 validator: (val)=> val.isEmpty ? 'Enter a Email': null,
                onChanged: (val){
                  setState(() {
                    email= val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow[800],width: 2.0)
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow[800],width: 2.0)
                  ),
                ),
                validator: (val)=> val.length < 6 ? 'Enter a Password more than 6 character!!': null,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password= val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.yellow[800])),
                  onPressed: () async {
                    if(_formkey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result==null){
                          setState(()=> error = 'Could not Sign in with those credentials!');
                          loading = false;
                        }
        }
                  },
                  elevation: 0.0,
                  color: Colors.yellow[800],
                  textColor: Colors.white,
                  child: Text("Sign In",
                    style: TextStyle(fontSize: 14)),
                ),
                SizedBox(height: 12.0,),
                Text(error,style: TextStyle(color: Colors.red),),
                 SizedBox(height: 20.0,),
                 InkWell(
                   onTap: (){widget.toggleView();},
                   child: Text('Don\'t have account?'))
            ],
          ) )
      ),
    );
  }
}