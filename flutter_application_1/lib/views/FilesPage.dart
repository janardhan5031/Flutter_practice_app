import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/utils/CustomAppBar.dart';
import 'package:iconsax/iconsax.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({super.key});

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
    String _image = 'https://ouch-cdn2.icons8.com/84zU-uvFboh65geJMR5XIHCaNkx-BZ2TahEpE9TpVJM/rs:fit:784:784/czM6Ly9pY29uczfile:///home/administrator/Desktop/Projects/backend_pdf_service
    gu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvODU5/L2E1MDk1MmUyLTg1/ZTMtNGU3OC1hYzlh/LWU2NDVmMWRiMjY0/OS5wbmc.png';
  var _isFileSelected;
  File? _file;

  selectFile()async{
     final file = await FilePicker.platform.pickFiles(
      // type: FileType.custom,
      // allowedExtensions: ['png', 'jpg', 'jpeg']
    );

    print(file);

    if(file != null){
      setState(() {
        // _file= 
      });
    }
  }file:///home/administrator/Desktop/Projects/backend_pdf_service
    

  @override
  void initState() {
    super.initState();
    _isFileSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:"Files"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child:Image.network(_image, width: 300,height: 200,) ,
              ),
            ),
            
            

            if(_isFileSelected == true ) Container(
              height: 100,
              width: 100,
              color: Color.fromARGB(255, 139, 192, 235), // Use Container to set the color
            ),

            SizedBox(height: 20),

            GestureDetector(
              onTap: selectFile,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  dashPattern: [10, 4],
                  strokeCap: StrokeCap.round,
                  color: Colors.blue.shade400,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.folder_open, color: Colors.blue, size: 40,),
                        SizedBox(height: 15,),
                        Text('Select your file', style: TextStyle(fontSize: 15, color: Colors.grey.shade400),),
                      ],
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}