import 'dart:async';

import 'package:bookmytrip/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authentication with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(String email, String password, String urlSegment) async {
    final url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyAmTj6kXgRilZ1aCJ5tF_LsJmYSI6OXwzE';

    final response = await http
        .post(url,
            body: json.encode(
              {
                'email': email,
                'password': password,
                'returnSecureToken': true,
              },
            ))
        .catchError((err) {
      print(err);
    });
    final responseData = json.decode(response.body);

    _token = responseData['idToken'];
    _userId = responseData['localId'];
    _expiryDate = DateTime.now()
        .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      _autoLogout();
    notifyListeners();
  final prefs =await SharedPreferences.getInstance();
  final userData =json.encode({
    'token':_token,
    'uid':_userId,
    'expiryDate':_expiryDate.toIso8601String(),
  });
     prefs.setString('userData', userData);
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> login(String email, String password, BuildContext context) async {
    return _authenticate(email, password, 'verifyPassword').then((value) {
      if (_token != null) {
        Navigator.of(context).pushNamed(HomePage.routeId);
      }
    });
  }

  Future<UserCredential> googleSignIn()async{
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    _token = googleAuth.accessToken;
    _userId = googleAuth.idToken;
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<bool> tryAutoLogin()async{
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')){
      return false;
    }
    final existingUserData = jsonDecode(prefs.getString('userData')) as Map<String ,Object>;
    final expiryDate = DateTime.parse(existingUserData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = existingUserData['token'];
    _userId = existingUserData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;

  }
  Future<void> logout() async{
    _token = null;
    _userId = null;
    _expiryDate = null;
    if(_authTimer != null){
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }
  void _autoLogout(){
    if(_authTimer != null){
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
   _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
