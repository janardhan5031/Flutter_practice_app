import 'package:http/http.dart' as http;
import 'dart:convert';

class BackendService {
  final String _baseUrl = "development-api.chatnexo.com";

  Future<Map<String, String>> createNote(
      String accessToken, Map<String, dynamic> data) async {
    try {
      Uri url = Uri.https(_baseUrl, '/v1/notes/create-note');
      Map<String, dynamic> body = {
        "title": data["title"],
        "description": data["description"],
        "users": ["user1@example.com", "user2@example.com"]
      };
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      var response = await http.post(url, headers: headers, body: jsonEncode(body));
      
      if (response.statusCode == 200) {
        return {"type": "Success", "message": response.body};
      } else {
        return {"type": "Error", "message": response.body};
      }
    } catch (e) {
      return {"type": "Error", "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> getNotes(String accessToken) async {
    try {
      print(accessToken);
      Uri url = Uri.https(_baseUrl, '/v1/notes/notes');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      var response = await http.get(url, headers: headers);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"type": "Error", "message": response.body};
      }
    } catch (e) {
      return {"type": "Error", "message": e.toString()};
    }
  }
}
