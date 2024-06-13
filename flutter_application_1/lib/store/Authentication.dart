import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier{  // state manager
  Map<String, String> _auth ={};

  Map<String, String> getlogin(){
    return _auth;
  }

  void saveLogin(Map<String, String> data){
    _auth=data;
  }
}