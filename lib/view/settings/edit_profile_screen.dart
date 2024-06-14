import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends StatelessWidget with MyAppValidations {
  EditProfileScreen({super.key});

  final TextEditingController nameEditProfileController =
      TextEditingController(text: 'James Stone');
  final TextEditingController emailEditProfileController =
      TextEditingController(text: 'James_Stone0@gmail.com');
  final TextEditingController locationEditProfileController =
      TextEditingController(text: 'Chicago, Illinois');
  final TextEditingController dobController =
      TextEditingController(text: 'Feb 20, 2002');
  final selectedDate = Rx<DateTime?>(null);
  final selectedImagePath = ''.obs;
  final isFullName = true.obs;
  final isEmailAddress = true.obs;
  final isLocation = true.obs;
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode locationFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(title: 'Edit Profile', centerTitle: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VerSpace(6),
            Obx(() => _buildProfilePicture(context)),
            _buildProfileForm(context),
            const VerSpace(6),
            _buildSaveCancelButtons(context),
          ],
        ).paddingSymmetric(horizontal: 2.h),
      ),
    );
  }

  Widget _buildProfileForm(BuildContext context) {
    return Column(
      children: [
        const VerSpace(6),
        _buildEditableField(
          context,
          'Full Name',
          fullNameFocusNode,
          nameEditProfileController,
          isFullName,
        ),
        const VerSpace(2),
        _buildEditableField(
          context,
          'Email Address',
          emailFocusNode,
          emailEditProfileController,
          isEmailAddress,
        ),
        const VerSpace(2),
        _buildEditableField(
          context,
          'Location',
          locationFocusNode,
          locationEditProfileController,
          isLocation,
        ),
        const VerSpace(2),
        _buildDOBField(context),
      ],
    );
  }

  Widget _buildSaveCancelButtons(BuildContext context) {
    return Column(
      children: [
        _buildButton(context, 'Save', AppColor.primaryColor,
            AppColor.whiteColor, _handleSavePressed),
        const VerSpace(2),
        _buildButton(context, 'Cancel', AppColor.whiteColor,
            AppColor.darkBlackColor, _handleCancelPressed,
            isOutlined: true),
      ],
    );
  }

  Widget _buildProfilePicture(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 6.h,
          backgroundImage: selectedImagePath.value.isEmpty
              ? const NetworkImage(
                  'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg')
              : FileImage(File(selectedImagePath.value)) as ImageProvider,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => _showImagePickerOptions(context),
            child: CircleAvatar(
              radius: 1.5.h,
              backgroundColor: AppColor.primaryColor,
              child: Icon(Icons.camera_alt,
                  color: AppColor.whiteColor, size: 1.5.h),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableField(
      BuildContext context,
      String label,
      FocusNode focusNode,
      TextEditingController controller,
      RxBool isReadOnly) {
    return Column(
      children: [
        _buildEditProfileRow(context, label, () {
          isReadOnly.toggle();
          focusNode.requestFocus();
        }),
        Obx(() => _buildEditProfileField(context, controller, focusNode,
            readOnly: isReadOnly.value,
            hintText: 'Enter ${label.toLowerCase()}')),
      ],
    );
  }

  Widget _buildDOBField(BuildContext context) {
    return Column(
      children: [
        _buildEditProfileRow(context, 'DOB'),
        _buildEditProfileField(
          context,
          dobController,
          null,
          hintText: 'Select DOB',
          isDOB: true,
          readOnly: true,
          onTap: () => _selectDOB(context),
        ),
      ],
    );
  }

  Row _buildEditProfileRow(BuildContext context, String label,
      [VoidCallback? onEditProfileTap]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GetTextW4S14(label, color: AppColor.primaryColor),
        if (onEditProfileTap != null)
          GestureDetector(
            onTap: onEditProfileTap,
            child: Icon(Icons.edit, color: AppColor.primaryColor, size: 2.2.h),
          ),
      ],
    );
  }

  TextFormField _buildEditProfileField(
    BuildContext context,
    TextEditingController controller,
    FocusNode? focusNode, {
    required String hintText,
    bool isDOB = false,
    bool readOnly = false,
    void Function()? onTap,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      keyboardType: TextInputType.text,
      cursorColor: Colors.black,
      textInputAction: TextInputAction.next,
      onTap: onTap,
      style: TextStyle(fontSize: 16.sp),
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGreyColor, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGreyColor, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 1.h),
        suffixIconConstraints: BoxConstraints.tightFor(width: 5.h, height: 4.h),
        hintStyle: TextStyle(color: AppColor.darkBlackColor.withOpacity(0.7)),
        suffixIcon: isDOB
            ? const Icon(
                Icons.date_range_outlined,
                color: AppColor.primaryColor,
              )
            : null,
        isCollapsed: true,
        filled: true,
        fillColor: AppColor.bgColor,
        hintText: hintText,
        enabled: true,
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, Color backgroundColor,
      Color textColor, VoidCallback onPressed,
      {bool isOutlined = false}) {
    return SizedBox(
      height: 5.h,
      width: SizeConfig.width,
      child: isOutlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(backgroundColor),
                foregroundColor: WidgetStateProperty.all<Color>(textColor),
                overlayColor: WidgetStateProperty.all<Color>(
                    AppColor.primaryColor.withOpacity(0.3)),
                side: WidgetStateProperty.all<BorderSide>(
                    const BorderSide(color: AppColor.darkBlackColor, width: 1)),
                shape: WidgetStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              child: GetTextW4S16(label, color: textColor),
            )
          : MaterialButton(
              onPressed: onPressed,
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: GetTextW4S16(label, color: textColor),
            ),
    );
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Photo Library'),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleSavePressed() {
    final errorMessage = editProfileScreenErrorHandler(
      name: nameEditProfileController,
      email: emailEditProfileController,
      location: locationEditProfileController,
      dob: dobController,
    );
    if (errorMessage.isEmpty) {
      showSnackBar('Profile updated Successfully.', true);
    } else {
      showSnackBar(errorMessage, false);
    }
  }

  void _handleCancelPressed() {
    // Add cancel functionality
  }

  Future<void> _selectDOB(BuildContext context) async {
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

  void _pickImage(ImageSource source) async {
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
