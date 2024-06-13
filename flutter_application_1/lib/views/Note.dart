import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/services/backend_service.dart';
import 'package:flutter_application_1/store/Authentication.dart';
import 'package:flutter_application_1/store/task_model.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});
  // final Function(Object) addNote;

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  final _formKey = GlobalKey<FormState>();
  final BackendService backendService = BackendService();
  final accessToken ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjUxYzUxZDRhZmU3Y2E0MmQ0MGI4YTIiLCJ1c2VyTmFtZSI6ImphbmFyZGhuIiwiZW1haWwiOiJiamFuYXJkaGFuNTAzMSsxMDRAZ21haWwuY29tIiwibnVtYmVyIjo5NjY2NTI4MjIwLCJjb3VudHJ5Q29kZSI6Iis5MSIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwiaXNQcmVtaXVtVXNlciI6ZmFsc2UsImNyZWF0ZWRBdCI6IjIwMjQtMDUtMjVUMTY6MzE6MTAuNTczWiIsIl9fdiI6MCwiaWF0IjoxNzE4MjEzNTU1LCJleHAiOjE3MTgyMzE1NTV9.sF6qB8_H89OiAYcjQGOA4MAE4OosdxXLSpqOIkn7p4c";


  @override
  void initState(){
    super.initState();
    nameController = TextEditingController();
    descriptionController= TextEditingController();
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:(context,value, child)=> Scaffold(
      // background color
      backgroundColor: Colors.blue[100],

      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('First Page'),
        ),
      
      //body
      body: Center(    
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please enter your Title";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please enter your description";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Submit Buttom
                ElevatedButton(
                  onPressed: ()async{
                    
                    final tasks = context.read<TaskModel>();
                    var loginDetails = context.read<AuthModel>().getlogin();
                    if(_formKey.currentState!.validate()==true){
                      tasks.addTask({"title":nameController.text.trim(),"description" :descriptionController.text.trim()});
                      backendService.createNote(loginDetails["accessToken"]!, {"title":nameController.text.trim(),"description" :descriptionController.text.trim()});
                      Navigator.of(context).pop();
                    }

                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        )
      )
    )
    );
  }
}