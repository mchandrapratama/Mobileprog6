 // ignore_for_file: deprecated_member_use, library_private_types_in_public_api
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return const MaterialApp(
title: 'Flutter Demo',
home: AccessCameraPage(),
);
}
}
class AccessCameraPage extends StatefulWidget {
const AccessCameraPage({super.key});
@override
_AccessCameraPageState createState() => _AccessCameraPageState();
}
class _AccessCameraPageState extends State<AccessCameraPage> {
File? _image;
Future<void> openCamera() async {
final pickedImage =
await ImagePicker().getImage(source: ImageSource.camera);
if (pickedImage != null) {
setState(() {
_image = File(pickedImage.path);
});
}
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Access Camera"),
),
body: Center(
child: _image == null ? const Text("No Image") : Image.file(_image!),
),
floatingActionButton: FloatingActionButton(
backgroundColor: Colors.green,
onPressed: () {
openCamera();
},
child: const Icon(
Icons.add_a_photo,
color: Colors.white,
),
),
);
}
