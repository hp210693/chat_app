import 'dart:convert';
import 'package:chat_app_flutter/assets/Languges/login_lang.dart';
import 'package:chat_app_flutter/screens/bases/loading_base.dart';
import 'package:chat_app_flutter/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../bases/text_input_base.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///
  _LoginScreenState() {
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return _check == false
        ? Container(
            color: Colors.white,
          )
        : MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                padding: const EdgeInsets.fromLTRB(
                  15,
                  0,
                  15,
                  0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          50,
                          0,
                          0,
                        ),
                      ),

                      /// Image logo
                      Image.asset(
                        _loginLang.logoURL,
                        width: 100,
                        height: 100,
                        fit: BoxFit.scaleDown,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          50,
                          0,
                          0,
                        ),
                      ),

                      /// Text form email
                      TextInputBase(
                        _loginLang.emailTitle,
                        _loginLang.titleHint,
                        _loginLang.emailColor,
                        _loginLang.emailFontFamily,
                        _loginLang.emailFontSize,
                        _loginLang.emailFontWeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          10,
                          0,
                          10,
                        ),
                      ),

                      /// Text form password
                      TextInputBase(
                        _loginLang.passwordTitle,
                        _loginLang.titleHint,
                        _loginLang.passwordColor,
                        _loginLang.passwordFontFamily,
                        _loginLang.passwordFontSize,
                        _loginLang.passwordFontWeight,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          20,
                        ),
                      ),

                      /// Text forgot password
                      Text(
                        _loginLang.forgotPassTitle,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(
                            int.parse(
                              _loginLang.forgotPassColor,
                            ),
                          ),
                          fontSize: double.parse(
                            _loginLang.forgotPassFontSize,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          10,
                          0,
                          0,
                        ),
                      ),

                      /// Button login
                      SizedBox(
                        height: 45,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                useSafeArea: true,
                                builder: (context) {
                                  return LoadingBase();
                                },
                              );

                              await loginAction();
                              Navigator.pop(context);
                              /*Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen(),
                                ),
                              );*/
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }
                          },
                          color: Colors.blueAccent,
                          child: Text(
                            _loginLang.loginTitle,
                            style: TextStyle(
                              color: Color(
                                int.parse(
                                  _loginLang.loginColor,
                                ),
                              ),
                              fontSize: double.parse(
                                _loginLang.loginFontSize,
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// Sign up account
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _loginLang.noAccountTitle,
                                  style: TextStyle(
                                    color: Color(
                                      int.parse(
                                        _loginLang.noAccountColor,
                                      ),
                                    ),
                                    fontSize: double.parse(
                                      _loginLang.noAccountFontSize,
                                    ),
                                  ),
                                ),
                                Text(
                                  _loginLang.signUpTitle,
                                  style: TextStyle(
                                    color: Color(
                                      int.parse(
                                        _loginLang.signUpColor,
                                      ),
                                    ),
                                    fontSize: double.parse(
                                      _loginLang.signUpFontSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  ///
  loadJson() async {
    String data =
        await rootBundle.loadString('assets/languages/vn/login_screen.json');
    var jsonResult = await json.decode(data);
    _loginLang = LoginLang.fromJson(jsonResult);

    setState(() {
      _check = true;
    });
  }

  ///
  Future<bool> loginAction() async {
    //replace the below line of code with your login request
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  final _formKey = GlobalKey<FormState>();
  bool _check = false;
  LoginLang _loginLang;
}
