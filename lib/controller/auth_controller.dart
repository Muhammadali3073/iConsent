import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AuthController extends GetxController {
  // Sign Up Controllers
  final TextEditingController nameSignUpController = TextEditingController();
  final TextEditingController emailSignUpController = TextEditingController();
  final TextEditingController setPasswordSignUpController =
      TextEditingController();
  final TextEditingController confirmPasswordSignUpController =
      TextEditingController();

  // Login Controllers
  final TextEditingController emailLoginController =
      TextEditingController(text: 'ali@gmai.com');
  final TextEditingController passwordLoginController =
      TextEditingController(text: 'Admin@123');

  // Forgot Password Controllers
  final TextEditingController emailForgotController = TextEditingController();
  final TextEditingController newPasswordForgotController =
      TextEditingController();
  final TextEditingController confirmNewPasswordForgotController =
      TextEditingController();

  // Gender Controller
  final TextEditingController genderController = TextEditingController();

  // Location Controller
  final TextEditingController locationController = TextEditingController();

  // DOB Selected Date and Controller
  var selectedDate = Rx<DateTime?>(null);
  final TextEditingController dobController = TextEditingController();

  // Selected Profile Image
  var selectedImagePath = ''.obs;

  // Observables to manage the state of the checkboxes, password visibility and others
  var isCheckTermCondition = false.obs;
  var isShowPassword = true.obs;
  var isShowConfirmPassword = true.obs;
  var isShowSetPassword = true.obs;
  var isShowConfirmNewPassword = false.obs;
  var isShowNewPassword = false.obs;
  var selectedIndexGender = 6.obs;

  // Toggles the state of the 'Terms and Conditions' checkbox.
  void toggleTermsCondition(bool value) {
    isCheckTermCondition.value = value;
  }

  // Toggles the visibility of the password field.
  void togglePasswordVisibility() {
    isShowPassword.value = !isShowPassword.value;
  }

  // Toggles the visibility of the confirm password field.
  void toggleConfirmPasswordVisibility() {
    isShowConfirmPassword.value = !isShowConfirmPassword.value;
  }

  // Toggles the visibility of the confirm new password field.
  void toggleConfirmNewPasswordVisibility() {
    isShowConfirmNewPassword.value = !isShowConfirmNewPassword.value;
  }

  // Toggles the visibility of the set password field.
  void toggleSetPasswordVisibility() {
    isShowSetPassword.value = !isShowSetPassword.value;
  }

  // Toggles the visibility of the new password field.
  void toggleNewPasswordVisibility() {
    isShowNewPassword.value = !isShowNewPassword.value;
  }

  // Select DOB Date Picker
  Future<void> selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.primaryColor,
            colorScheme:
                const ColorScheme.light(primary: AppColor.primaryColor),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      dobController.text =
          DateFormat('MMM d, yyyy').format(selectedDate.value!);
    }
  }

  // Select Profile Image
  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      selectedImagePath.value = '';
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.TOP);
    }
  }
}
