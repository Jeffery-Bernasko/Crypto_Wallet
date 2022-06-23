import 'package:crypto_wallet/net/flutterfire.dart';
import 'package:crypto_wallet/ui/home_view.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: _emailField,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(
                  color: Colors.grey
                    ),
                    ),
                   // icon: Icon(Icons.email_sharp),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/35,),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextField(
                  controller: _passwordField,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(
                  color: Colors.grey
                  ),
                  ),
                  //  icon: Icon(Icons.lock_outline_sharp),
                ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/35,),
              Container(
                width: MediaQuery.of(context).size.width / 1.4, 
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.white
                ),

                child: ElevatedButton(
                  onPressed: () async {
                    bool shouldNavigate = await registerUser(_emailField.text, _passwordField.text);
                    if(shouldNavigate){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView())); 
                    }
                  },
                  child: Text('Register'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/35,),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.white
                ),

                child: ElevatedButton(
                  onPressed: () async {
                    bool shouldNavigate = await signIn(_emailField.text, _passwordField.text);
                    if(shouldNavigate){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                    }
                  },
                  child: Text('Login'),
                ),
              )
            ],
          )),
    );
  }
}
