import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/faculty_role_model.dart';
import '../views/login_screen.dart';
import '../constants/const_colors.dart';

class FacultyRoleController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<File?> profileImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      profileImage.value = File(img.path);
    }
  }

  Future<void> signUpFaculty(FacultyModel faculty) async {
    isLoading.value = true;

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://your-api-endpoint.com/faculty/signup'),
      );

      // ADD FIELDS
      faculty.toJson().forEach((key, value) {
        request.fields[key] = value;
      });

      // ADD IMAGE
      if (profileImage.value != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'profile_image',
            profileImage.value!.path,
          ),
        );
      }

      var response = await request.send();
      var respStr = await response.stream.bytesToString();
      var respJson = jsonDecode(respStr);

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Faculty account created successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.snackbarSucessColor,
          colorText: AppColors.snackbarTextColor,
        );
        Get.offAll(() => LoginScreen());
      } else {
        Get.snackbar(
          "Error",
          respJson['message'] ?? "Something went wrong",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.snackbarColor,
          colorText: AppColors.snackbarTextColor,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed: $e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.snackbarColor,
        colorText: AppColors.snackbarTextColor,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
