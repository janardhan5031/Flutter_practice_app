import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/RouteGenerator.dart';
import 'package:flutter_application_1/models/auth_model.dart';
import 'package:flutter_application_1/services/backend_service.dart';
import 'package:flutter_application_1/store/Authentication.dart';
import 'package:flutter_application_1/views/TodoList.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController nameController;
  final BackendService backendService = BackendService();

  @override
  void initState(){
    super.initState();
    nameController = TextEditingController();
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child)=>Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: Column(
        children: [
          const SizedBox(height: 200),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            decoration: const InputDecoration(
              labelText: "Mobile Number",
              border: OutlineInputBorder()
            ),
            validator: (value){
               if (value == null || value.isEmpty) {
                  return "Please enter your Mobile Number";
                } else if (value.length != 10) {
                  return "Mobile Number must be 10 digits";
                }
                return null;
            },
          ),

          const SizedBox(height: 20),


          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.purple.shade200)),
              onPressed: () async {
                print("login button pressed");
                RouteGenerator.isLoggedIn = true;

                try {
                  var response = await backendService.login(nameController.text.trim());
                  LoginResponse loginResponse = LoginResponse.fromJson(response);

                  Map<String, String> data = {
                    "accessToken": loginResponse.message.result.accessToken,
                    "userName": loginResponse.message.result.accessToken,
                    "email": loginResponse.message.result.email,
                  };

                  final authModel = context.read<AuthModel>();
                  authModel.saveLogin(data);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => TodoList()));

                  RouteGenerator.isLoggedIn=true;

                  // save user creds in sharedPreferences (local storage)
                  // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  // sharedPreferences.setString("MOBILE_NUMBER", "9666528220");

                  // print(sharedPreferences.getString("MOBILE_NUMBER"));

                } catch (e) {
                  print(e);
                }
              },
              child: Text("Login")),
        ],
      )),
    )
  );
  }
}
