import 'dart:async';

import 'package:bookmytrip/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _timer;

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

    notifyListeners();

    print(jsonDecode(response.body));

  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> login(String email, String password,BuildContext context) async {
    return  _authenticate(email, password, 'verifyPassword').then((value) {
      if(_token != null){
        Navigator.of(context).pushNamed(HomePage.routeId);
      }
    });
  }

  void logout(){
    _token = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
  }
}
