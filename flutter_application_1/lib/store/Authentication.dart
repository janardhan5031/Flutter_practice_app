import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier{  // state manager
  Map<String, String> _auth ={
    "accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjUxYzUxZDRhZmU3Y2E0MmQ0MGI4YTIiLCJ1c2VyTmFtZSI6ImphbmFyZGhuIiwiZW1haWwiOiJiamFuYXJkaGFuNTAzMSsxMDRAZ21haWwuY29tIiwibnVtYmVyIjo5NjY2NTI4MjIwLCJjb3VudHJ5Q29kZSI6Iis5MSIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwiaXNQcmVtaXVtVXNlciI6ZmFsc2UsImNyZWF0ZWRBdCI6IjIwMjQtMDUtMjVUMTY6MzE6MTAuNTczWiIsIl9fdiI6MCwiaWF0IjoxNzE4MzA2MTMzLCJleHAiOjE3MTgzMjQxMzN9.XdUrAB4rDqjkysIRA49jGGauOIGLTXrE4yJ1OamA_6E"
    };

  Map<String, String> getlogin(){
    return _auth;
  }

  void saveLogin(Map<String, String> data){
    _auth=data;
  }
}