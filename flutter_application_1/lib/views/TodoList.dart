import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/backend_service.dart';
import 'package:flutter_application_1/store/task_model.dart';
import 'package:flutter_application_1/views/Note.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});
  // final Map list;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final accessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjUxYzUxZDRhZmU3Y2E0MmQ0MGI4YTIiLCJ1c2VyTmFtZSI6ImphbmFyZGhuIiwiZW1haWwiOiJiamFuYXJkaGFuNTAzMSsxMDRAZ21haWwuY29tIiwibnVtYmVyIjo5NjY2NTI4MjIwLCJjb3VudHJ5Q29kZSI6Iis5MSIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwiaXNQcmVtaXVtVXNlciI6ZmFsc2UsImNyZWF0ZWRBdCI6IjIwMjQtMDUtMjVUMTY6MzE6MTAuNTczWiIsIl9fdiI6MCwiaWF0IjoxNzE4MjEzNTU1LCJleHAiOjE3MTgyMzE1NTV9.sF6qB8_H89OiAYcjQGOA4MAE4OosdxXLSpqOIkn7p4c";
  final BackendService backendService = BackendService();
  bool isLoading = false;
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted=true;
    _fetchNotes();
  }

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isMounted) {
      _fetchNotes();
    }
  }

  Future<void> _fetchNotes() async {
    setState(() {
      isLoading = true;
    });
    try {
      if(!_isMounted) return;

      var response = await backendService.getNotes(accessToken);
      if (response['status'] == 'SUCCESS') {
        List<dynamic> notes = response['result']['notes'];

        List<Map<String, String>> list = [];
        for (var data in notes) {
          list.add({
            "title": data['title'] is String ? data['title'] : "",
            "description":
                data['description'] is String ? data['description'] : "",
          });
        }
        context.read<TaskModel>().addList(list);
        setState(() {
          isLoading = false;
        });
      } else {}
    } catch (e) {
      print(e);
      // setState(() {
      //   _errorMessage = 'Failed to fetch notes';
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text("Todo List"),
            ),
            body: Column(
              children: [
                //cotainer  //InkWell and GuesterDetector widgets for onTap functionality
                Container(
                    color:Colors.blue[100],
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 56,
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: ListView.builder(
                      itemCount: value.getLength(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => GuesterDetector()));
                            print("list clicked");
                          },
                          child: Container(
                              // color: Colors.blue[100],
                              margin: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10),
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.blue[400],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Title : ${value.getTask(index)["title"]}"),
                                  Text(
                                      "Description : ${value.getTask(index)["description"]}"),
                                ],
                              )),
                        );
                      },
                    ))
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Navigator.of(context).pushNamed("/note");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotePage()));
              },
              tooltip: 'Add Note',
              child: const Icon(Icons.add),
            )));
  }
}
