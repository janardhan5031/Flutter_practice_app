import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/RouteGenerator.dart';
import 'package:flutter_application_1/models/auth_model.dart';
import 'package:flutter_application_1/services/backend_service.dart';
import 'package:flutter_application_1/store/Authentication.dart';
import 'package:flutter_application_1/views/Home.dart';
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
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    nameController = TextEditingController();
    getLoginResponse();
  }

  Future getLoginResponse()async{
    try{
     
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = prefs.getBool("isLoggedIn")??false;
      String? mobileNumber = prefs.getString("mobileNumber")??"";
      String? tokenExpiration = prefs.getString("tokenExpiration")??"";
      print(isLoggedIn);
      print(mobileNumber);
      print(tokenExpiration);

      // print(DateTime.parse(DateTime.now().toString()));

      if(isLoggedIn ==true){
         setState(() {
        _isLoading=true;
      });
        _setLogin(mobileNumber);
      }
      // setState(() {
      //   _isLoadging=false;
      // });
    }catch(e){
      print(e);
    }
  }

  _setLogin(String mobileNumber)async{
    try{
      var response = await backendService.login(mobileNumber);
      LoginResponse loginResponse = LoginResponse.fromJson(response);

      Map<String, String> data = {
        "accessToken": loginResponse.message.result.accessToken,
        "userName": loginResponse.message.result.accessToken,
        "email": loginResponse.message.result.email,
      };

      final authModel = context.read<AuthModel>();
      authModel.saveLogin(data);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeWidget()));
      
      // save isLoggedIn =true in shared_preferences
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool("isLoggedIn", true);
      pref.setString("tokenExpiration",DateTime.now().add(Duration(hours: 5)).toString());
      pref.setString("mobileNumber", mobileNumber);

      RouteGenerator.isLoggedIn=true;
    }catch(e){
      print(e);
    }
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
      appBar: _isLoading==false ? AppBar(
        title: Text("Login"),
        backgroundColor: Colors.purple[200],
      ):null,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _isLoading?[
          CircularProgressIndicator()
        ]:[
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
                try {                  
                  _setLogin(nameController.text.trim());
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
