import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/controller/profile_controller.dart';
import 'package:i_consent/extensions/keyboard_dismiss_extension.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final ProfileController profileController =
      Get.find(tag: 'profileController');

  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode locationFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GetAppBar(title: 'Edit Profile', centerTitle: false),
      body: SafeArea(
        child: Padding(
          padding: Spacing.only(right: 2, left: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildProfileForm(context),
              _buildSaveCancelButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileForm(BuildContext context) {
    return Column(
      children: [
        Obx(() => _buildProfilePicture(context)),
        const VerSpace(4),
        _buildEditableField(
            context,
            'Full Name',
            fullNameFocusNode,
            profileController.nameEditProfileController,
            profileController.isFullName),
        const VerSpace(2),
        _buildEditableField(
            context,
            'Email Address',
            emailFocusNode,
            profileController.emailEditProfileController,
            profileController.isEmailAddress),
        const VerSpace(2),
        _buildEditableField(
            context,
            'Location',
            locationFocusNode,
            profileController.locationEditProfileController,
            profileController.isLocation),
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
          backgroundImage: profileController.selectedImagePath.value.isEmpty
              ? const NetworkImage(
                  'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg')
              : FileImage(File(profileController.selectedImagePath.value))
                  as ImageProvider,
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
            hintText: 'Enter $label.toLowerCase()')),
      ],
    );
  }

  Widget _buildDOBField(BuildContext context) {
    return Column(
      children: [
        _buildEditProfileRow(context, 'DOB'),
        _buildEditProfileField(
          context,
          profileController.dobController,
          null,
          hintText: 'Select DOB',
          isDOB: true,
          readOnly: true,
          onTap: () => profileController.selectDOB(context),
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
      onTapOutside: (event) => context.dismissKeyboard(),
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
      width: double.infinity,
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
                profileController.pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              onTap: () {
                profileController.pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleSavePressed() {
    // Add save functionality
  }

  void _handleCancelPressed() {
    // Add cancel functionality
  }
}
