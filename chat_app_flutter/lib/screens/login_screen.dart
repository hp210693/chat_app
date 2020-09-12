import 'package:flutter/material.dart';
import 'bases/text_input_base.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                ),

                /// Image logo
                Image.asset(
                  "assets/images/logo/logo.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.scaleDown,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                ),
                // Text form email
                TextInputBase("Email"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                ),
                // Text form password
                TextInputBase("Password"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
                // Text forgot password
                Text("Forgot password?",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.lightBlue, fontSize: 14)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                ),
                // Button login
                SizedBox(
                  height: 45,
                  child: RaisedButton(
                    onPressed: () => {},
                    color: Colors.blueAccent,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                // Sign up account
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 14),
                          ),
                          Text(
                            "Sign Up.",
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
