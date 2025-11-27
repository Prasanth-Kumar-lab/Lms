import 'package:get/get.dart';
import 'package:lms/constants/const_colors.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPasswordHidden = true.obs; // Observable for password visibility

  // login function
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    if (email == "student@test.com" && password == "1234") {
      Get.snackbar(
        "Success",
        "Login successful!",
        backgroundColor: AppColors.snackbarSucessColor,
        colorText: AppColors.snackbarTextColor,
      );
    } else {
      Get.snackbar(
        "Error",
        "Invalid credentials",
        backgroundColor: AppColors.snackbarColor,
        colorText: AppColors.snackbarTextColor,
      );
    }
    isLoading.value = false;
  }

  // toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
