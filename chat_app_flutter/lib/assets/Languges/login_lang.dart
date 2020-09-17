class LoginLang {
  ///
  LoginLang.fromJson(Map<String, dynamic> json)
      : this._logoURL = json['logoURL'],
        this._titleHint = json['titleHint'],
        this._email = json['email'],
        this._password = json['password'],
        this._forgotPass = json['forgotPass'],
        this._login = json['login'],
        this._noAccount = json['noAccount'],
        this._signUp = json['signUp'];

  /*Map<String, dynamic> toJson() => {
        'logoURL': this._logoURL,
        'titleHint': this._titleHint,
        'email': this._email,
        'password': this._password,
        'forgotPass': this._forgotPass,
        'login': this._login,
        'noAccount': this._noAccount,
        'signUp': this._signUp,
      };

  Future<Map<String, dynamic>> parseJsonFromAssets() async {
    TypeLang type = TypeLang.en;
    String assetsPath = "assets/languages/en/login_screen.json";

    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }

  loadJson() async {
    String data =
        await rootBundle.loadString('assets/languages/vn/login_screen.json');
    var jsonResult = await json.decode(data);
    // _loginLang = LoginLang.fromJson(jsonResult);
  }*/

  String get logoURL => this._logoURL;
  String get titleHint => this._titleHint;

  String get emailTitle => this._email["title"];
  String get emailColor => this._email["color"];
  String get emailFontFamily => this._email["fontFamily"];
  String get emailFontSize => this._email["fontSize"];
  String get emailFontWeight => this._email["fontWeight"];

  String get passwordTitle => this._password["title"];
  String get passwordColor => this._password["color"];
  String get passwordFontFamily => this._password["fontFamily"];
  String get passwordFontSize => this._password["fontSize"];
  String get passwordFontWeight => this._password["fontWeight"];

  String get forgotPassTitle => this._forgotPass["title"];
  String get forgotPassColor => this._forgotPass["color"];
  String get forgotPassFontFamily => this._forgotPass["fontFamily"];
  String get forgotPassFontSize => this._forgotPass["fontSize"];
  String get forgotPassFontWeight => this._forgotPass["fontWeight"];

  String get loginTitle => this._login["title"];
  String get loginColor => this._login["color"];
  String get loginFontFamily => this._login["fontFamily"];
  String get loginFontSize => this._login["fontSize"];
  String get loginFontWeight => this._login["fontWeight"];

  String get noAccountTitle => this._noAccount["title"];
  String get noAccountColor => this._noAccount["color"];
  String get noAccountFontFamily => this._noAccount["fontFamily"];
  String get noAccountFontSize => this._noAccount["fontSize"];
  String get noAccountFontWeight => this._noAccount["fontWeight"];

  String get signUpTitle => this._signUp["title"];
  String get signUpColor => this._signUp["color"];
  String get signUpFontFamily => this._signUp["fontFamily"];
  String get signUpFontSize => this._signUp["fontSize"];
  String get signUpFontWeight => this._signUp["fontWeight"];

  final String _logoURL;
  final String _titleHint;
  final Map<String, dynamic> _email;
  final Map<String, dynamic> _password;
  final Map<String, dynamic> _forgotPass;
  final Map<String, dynamic> _login;
  final Map<String, dynamic> _noAccount;
  final Map<String, dynamic> _signUp;
}
