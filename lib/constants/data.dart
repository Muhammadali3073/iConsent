import 'package:get/get.dart';

class AppData {
  static const String logo = 'logo.png';
  static const String splashImage = 'splash_image.png';
  static const String emailIcon = 'at.svg';
  static const String lockIcon = 'lock.svg';
  static const String userIcon = 'user.svg';
  static const String fbIcon = 'fb.png';
  static const String googleIcon = 'google.svg';
  static const String appleIcon = 'apple.svg';
  static const String successIcon = 'success.svg';
  static const String profileIcon = 'profile.svg';
  static const String settingIcon = 'setting.svg';
  static const String chatIcon = 'chat.svg';
  static const String homeIcon = 'home.svg';
  static const String maleIcon = 'male.svg';
  static const String femaleIcon = 'female.svg';
  static const String nonBinaryIcon = 'non_binary.png';
  static const String transIcon = 'trans.png';
  static const String logoutIcon = 'logout.svg';
  static const String deleteIcon = 'delete.svg';
  static const String headsetIcon = 'headset.svg';
  static const String reminderIcon = 'reminder.svg';
  static const String tcIcon = 't&c.svg';
  static const String changePasswordIcon = 'change_password.svg';
  static const String helpIcon = 'help.svg';
  static const String dangerIcon = 'danger.svg';
  static const String editProfileIcon = 'edit_profile.svg';

  static final List<GenderData> genderList = [
    GenderData(maleIcon, 'Male'),
    GenderData(femaleIcon, 'Female'),
    GenderData(nonBinaryIcon, 'Non-Binary'),
    GenderData(transIcon, 'Trans-man'),
    GenderData(transIcon, 'Trans-woman'),
  ];

  static final List<SettingTileModel> settingsTileDataList = [
    SettingTileModel(editProfileIcon, 'Edit Profile', true),
    SettingTileModel(reminderIcon, 'Reminder', true),
    SettingTileModel(changePasswordIcon, 'Change password', true),
    SettingTileModel(tcIcon, 'Terms & Conditions', true),
    SettingTileModel(headsetIcon, 'Feedback & Support', true),
    SettingTileModel(logoutIcon, 'Logout', false),
    SettingTileModel(deleteIcon, 'Delete Account', false),
  ];

  static final List<SettingTileModel> feedbackTileDataList = [
    SettingTileModel(dangerIcon, 'Report a Problem', true),
    SettingTileModel(helpIcon, 'Help Centre', true),
    SettingTileModel(changePasswordIcon, 'Privacy & Security Help', true),
  ];

  static final ConsentActivitiesData kissingConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Please select your preferences for kissing.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Kissing on lips', RxBool(false)),
      ConsentActivitiesCheck('Kissing on cheeks', RxBool(false)),
      ConsentActivitiesCheck('Kissing on the neck', RxBool(false)),
      ConsentActivitiesCheck('French kissing', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData touchingConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Please select your preferences for touching.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Holding hands', RxBool(false)),
      ConsentActivitiesCheck('Hugging', RxBool(false)),
      ConsentActivitiesCheck('Cuddling', RxBool(false)),
      ConsentActivitiesCheck('Caressing face', RxBool(false)),
      ConsentActivitiesCheck('Touching arms', RxBool(false)),
      ConsentActivitiesCheck('Touching back', RxBool(false)),
      ConsentActivitiesCheck('Touching legs', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData sexualTouchingConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Please select your preferences for sexual touching.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Touching breast/chest', RxBool(false)),
      ConsentActivitiesCheck(
          'Touching genitals (over clothing)', RxBool(false)),
      ConsentActivitiesCheck(
          'Touching genitals (over clothing)', RxBool(false)),
      ConsentActivitiesCheck('Fingering', RxBool(false)),
      ConsentActivitiesCheck('Hand job ', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData oralActivitiesConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Please select your preferences for oral activities.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Oral sex (giving)', RxBool(false)),
      ConsentActivitiesCheck('Oral sex (receiving)', RxBool(false)),
      ConsentActivitiesCheck('Kissing with tongue', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData intercourseConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Please select your preferences for intercourse.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Vaginal intercourse', RxBool(false)),
      ConsentActivitiesCheck('Anal intercourse', RxBool(false)),
      ConsentActivitiesCheck('Penetration with fingers', RxBool(false)),
      ConsentActivitiesCheck('Penetration with sex toys', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData kinkConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Please select your preferences for BDSM and Kink.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Light spanking', RxBool(false)),
      ConsentActivitiesCheck('Heavy spanking', RxBool(false)),
      ConsentActivitiesCheck('Bondage (light restraints)', RxBool(false)),
      ConsentActivitiesCheck('Bondage (heavy restraints)s', RxBool(false)),
      ConsentActivitiesCheck('Role playing', RxBool(false)),
      ConsentActivitiesCheck('Use of safe words', RxBool(false)),
      ConsentActivitiesCheck('Dominance/submission dynamics ', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData communicationConsentActivitiesData =
      ConsentActivitiesData(
    question:
        'Please select your preferences for communication and verbal consent.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Dirty talk', RxBool(false)),
      ConsentActivitiesCheck('Use of specific words/phrases', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData physicalIntimacyConsentActivitiesData =
      ConsentActivitiesData(
    question:
        'Please select your preferences for non-sexual physical intimacy.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Sleeping in the same bed', RxBool(false)),
      ConsentActivitiesCheck('Sharing a shower or bath', RxBool(false)),
      ConsentActivitiesCheck('Massage (non-sexual)', RxBool(false)),
      ConsentActivitiesCheck('Massage (sexual)', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData digitalIntimacyConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Please select your preferences for digital intimacy.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Sexting', RxBool(false)),
      ConsentActivitiesCheck('Sharing intimate photos', RxBool(false)),
      ConsentActivitiesCheck('Video calls (intimate content)', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData experimentalConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Please select your preferences for experimental activities.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Trying new sexual positions', RxBool(false)),
      ConsentActivitiesCheck('Using new sex toys', RxBool(false)),
      ConsentActivitiesCheck('Watching erotic content together', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData conditionsConsentActivitiesData =
      ConsentActivitiesData(
    question:
        'Please select & specify your preferences for frequency and conditions.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Regularly', RxBool(false)),
      ConsentActivitiesCheck('Occasionally', RxBool(false)),
      ConsentActivitiesCheck('Never', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData comfortConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Please select your preferences for Safety and Comfort.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Use of condoms', RxBool(false)),
      ConsentActivitiesCheck('Use of dental dams', RxBool(false)),
      ConsentActivitiesCheck('Use of lubrication', RxBool(false)),
      ConsentActivitiesCheck(
          'Only with clear verbal consent each time', RxBool(false)),
    ],
  );
  static final ConsentActivitiesData customizationConsentActivitiesData =
      ConsentActivitiesData(
    question: 'Additional Customization(other)',
    consentActivitiesCheck: [],
  );
}

class ConsentActivitiesData {
  String? question;
  List<ConsentActivitiesCheck>? consentActivitiesCheck;

  ConsentActivitiesData({this.question, this.consentActivitiesCheck});
}

class ConsentActivitiesCheck {
  String? title;
  RxBool? isCheck;

  ConsentActivitiesCheck(this.title, this.isCheck);
}

class GenderData {
  String? icon;
  String? type;

  GenderData(this.icon, this.type);
}

class SettingTileModel {
  String icon;
  String title;
  bool isNext;

  SettingTileModel(this.icon, this.title, this.isNext);
}
