import 'package:fileupload/controoler/imagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddImagesScreens extends StatefulWidget {
  const AddImagesScreens({super.key});

  @override
  State<AddImagesScreens> createState() => _AddImagesScreensState();
}

class _AddImagesScreensState extends State<AddImagesScreens> {
  final ImageController imageController = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Images Database"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => imageController.imagePath.value.isEmpty
                ? const CircleAvatar(maxRadius: 100)
                : CircleAvatar(
              maxRadius: 100,
              backgroundImage: NetworkImage(imageController.imagePath.value),
            )),
            const SizedBox(height: 20),
            Obx(() => imageController.isLoading.value
                ? const CircularProgressIndicator()
                : TextButton(
              onPressed: () {
                imageController.pickImageFromCamera();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text(
                "Upload Images",
                style: TextStyle(color: Colors.white),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
