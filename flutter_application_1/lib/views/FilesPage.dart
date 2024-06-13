import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/CustomAppBar.dart';

class FilesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:"Files"),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Files Sections'),
          ],
        ),
      ),
    );
  }
}