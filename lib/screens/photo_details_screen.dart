
import 'package:flutter/material.dart';
import 'package:photo_gallery_app_using_rest_api/Models/user_model.dart';

class PhotoDetailsScreen extends StatelessWidget {
  final UserModel photo;
  const PhotoDetailsScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Photo Details "),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60.0,horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(photo.url.toString()),
            const SizedBox(height: 16.0),
            Text(
              "Title: ${photo.title.toString()}",
              style: const TextStyle(fontSize: 15),
            ),
            const  SizedBox(height: 8.0),
            Center(child: Text("ID: ${photo.id}"))
          ],
        ),
      ),
    );
  }
}
