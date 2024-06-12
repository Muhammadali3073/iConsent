import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileController extends GetxController {
  final TextEditingController nameEditProfileController =
      TextEditingController(text: 'James Stone');
  final TextEditingController emailEditProfileController =
      TextEditingController(text: 'James_Stone0@gmail.com');
  final TextEditingController locationEditProfileController =
      TextEditingController(text: 'Chicago, Illinois');
  final TextEditingController dobController =
      TextEditingController(text: 'Feb 20, 2002');
  final TextEditingController reminderMsgController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  var selectedImagePath = ''.obs;
  var isFullName = true.obs;
  var isEmailAddress = true.obs;
  var isLocation = true.obs;
  var isReminderAlert = false.obs;
  var selectedDate = Rx<DateTime?>(null);

  void toggleFullName() {
    isFullName.value = !isFullName.value;
  }

  void toggleEmailAddress() {
    isEmailAddress.value = !isEmailAddress.value;
  }

  void toggleLocation() {
    isLocation.value = !isLocation.value;
  }

  void toggleReminderAlert() {
    isReminderAlert.value = !isReminderAlert.value;
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
