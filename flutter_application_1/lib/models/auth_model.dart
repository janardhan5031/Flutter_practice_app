import 'dart:convert';

class LoginResponse {
  final String type;
  final Message message;

  LoginResponse({required this.type, required this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      type: json['type'],
      message: Message.fromJson(jsonDecode(json['message'])),
    );
  }
}

class Message {
  final String status;
  final String message;
  final Result result;

  Message({required this.status, required this.message, required this.result});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      status: json['status'],
      message: json['message'],
      result: Result.fromJson(json['result']),
    );
  }
}

class Result {
  final String accessToken;
  final String id;
  final String userName;
  final String email;
  final int number;
  final String countryCode;
  final bool isEmailVerified;
  final bool isPremiumUser;
  final String createdAt;
  final int version;

  Result({
    required this.accessToken,
    required this.id,
    required this.userName,
    required this.email,
    required this.number,
    required this.countryCode,
    required this.isEmailVerified,
    required this.isPremiumUser,
    required this.createdAt,
    required this.version,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      accessToken: json['accessToken'],
      id: json['_id'],
      userName: json['userName'],
      email: json['email'],
      number: json['number'],
      countryCode: json['countryCode'],
      isEmailVerified: json['isEmailVerified'],
      isPremiumUser: json['isPremiumUser'],
      createdAt: json['createdAt'],
      version: json['__v'],
    );
  }
}
