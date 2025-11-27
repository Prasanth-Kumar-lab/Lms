import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/signup_model.dart';
import '../views/login_screen.dart';
import '../constants/const_colors.dart';

class SignUpController extends GetxController {
  // LOADING
  RxBool isLoading = false.obs;

  // IMAGE PICKER
  Rx<File?> profileImage = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      profileImage.value = File(img.path);
    }
  }

  // SIGNUP METHOD
  Future<void> signUpStudent(StudentModel student) async {
    isLoading.value = true;

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://your-api-endpoint.com/signup'),
      );

      // Add fields to API
      student.toJson().forEach((key, value) {
        request.fields[key] = value ?? "";
      });

      // Add image file
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
          "Account created successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.snackbarSucessColor,
          colorText: AppColors.snackbarTextColor,
        );
        Get.offAll(LoginScreen());
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
