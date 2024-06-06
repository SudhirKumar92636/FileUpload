import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageController extends GetxController {
  final ImagePicker picker = ImagePicker();
  RxString imagePath = "".obs;
  RxBool isLoading = false.obs;

  void pickImageFromCamera() async {
    try {
      isLoading.value = true;
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        imagePath.value = image.path;
        await uploadImageToDatabase(File(image.path));
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to pick image: $e");
    }
  }

  Future<void> uploadImageToDatabase(File file) async {
    try {
      var uuid = Uuid();
      var fileName = uuid.v1();
      var storageRef = FirebaseStorage.instance.ref().child("File/$fileName");
      var uploadTask = storageRef.putFile(file);

      await uploadTask;
      String downloadURL = await storageRef.getDownloadURL();
      imagePath.value = downloadURL; // Update imagePath with the download URL
    } catch (e) {
      Get.snackbar("Error", "Failed to upload image: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
