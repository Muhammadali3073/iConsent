import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

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
  static const String addChatIcon = 'add_chat.svg';
  static const String callIcon = 'call.svg';
  static const String chatMenuIcon = 'chat_menu.svg';
  static const String fileIcon = 'file.svg';
  static const String sendIcon = 'send.svg';
  static const String videoIcon = 'video.svg';

  static final List<GenderData> genderList = [
    GenderData(maleIcon, 'Male'),
    GenderData(femaleIcon, 'Female'),
    GenderData(nonBinaryIcon, 'Non-Binary'),
    GenderData(transIcon, 'Trans-man'),
    GenderData(transIcon, 'Trans-woman'),
  ];

  static final List<String> iWantToList = [
    'Create Consent Form',
    'Modify an existing consent form',
    'Cancel an existing consent form',
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
    isSkip: RxBool(true),
    type: 'Kissing',
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
    isSkip: RxBool(false),
    type: 'Touching',
    question: 'Please select your preferences for touching.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Holding hands', RxBool(false)),
      ConsentActivitiesCheck('Hugging', RxBool(false)),
      ConsentActivitiesCheck('Cuddling', RxBool(false)),
      ConsentActivitiesCheck('Caressing face', RxBool(true)),
      ConsentActivitiesCheck('Touching arms', RxBool(false)),
      ConsentActivitiesCheck('Touching back', RxBool(false)),
      ConsentActivitiesCheck('Touching legs', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData sexualTouchingConsentActivitiesData =
      ConsentActivitiesData(
    isSkip: RxBool(false),
    type: 'Sexual Touching',
    question: 'Please select your preferences for sexual touching.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Touching breast/chest', RxBool(false)),
      ConsentActivitiesCheck(
          'Touching genitals (over clothing)', RxBool(true)),
      ConsentActivitiesCheck('Fingering', RxBool(false)),
      ConsentActivitiesCheck('Hand job ', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData oralActivitiesConsentActivitiesData =
      ConsentActivitiesData(
    isSkip: RxBool(true),
    type: 'Oral Activities',
    question: 'Please select your preferences for oral activities.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Oral sex (giving)', RxBool(false)),
      ConsentActivitiesCheck('Oral sex (receiving)', RxBool(false)),
      ConsentActivitiesCheck('Kissing with tongue', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData intercourseConsentActivitiesData =
      ConsentActivitiesData(
    isSkip: RxBool(true),
    type: 'Intercourse',
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
    isSkip: RxBool(true),
    type: 'BDSM and Kink',
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
    isSkip: RxBool(true),
    type: 'Communication and Verbal',
    question:
        'Please select your preferences for communication and verbal consent.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Dirty talk', RxBool(false)),
      ConsentActivitiesCheck('Use of specific words/phrases', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData physicalIntimacyConsentActivitiesData =
      ConsentActivitiesData(
    isSkip: RxBool(false),
    type: 'Non-sexual Physical Intimacy',
    question:
        'Please select your preferences for non-sexual physical intimacy.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Sleeping in the same bed', RxBool(true)),
      ConsentActivitiesCheck('Sharing a shower or bath', RxBool(false)),
      ConsentActivitiesCheck('Massage (non-sexual)', RxBool(false)),
      ConsentActivitiesCheck('Massage (sexual)', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData digitalIntimacyConsentActivitiesData =
      ConsentActivitiesData(
    isSkip: RxBool(true),
    type: 'Digital Intimacy',
    question: 'Please select your preferences for digital intimacy.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Sexting', RxBool(false)),
      ConsentActivitiesCheck('Sharing intimate photos', RxBool(false)),
      ConsentActivitiesCheck('Video calls (intimate content)', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData experimentalConsentActivitiesData =
      ConsentActivitiesData(
    isSkip: RxBool(true),
    type: 'Experimental Activities',
    question: 'Please select your preferences for experimental activities.',
    consentActivitiesCheck: [
      ConsentActivitiesCheck('Trying new sexual positions', RxBool(false)),
      ConsentActivitiesCheck('Using new sex toys', RxBool(false)),
      ConsentActivitiesCheck('Watching erotic content together', RxBool(false)),
    ],
  );

  static final ConsentActivitiesData conditionsConsentActivitiesData =
      ConsentActivitiesData(
    isSkip: RxBool(true),
    type: 'Frequency and Conditions',
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
    isSkip: RxBool(true),
    type: 'Safety and Comfort',
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
    isSkip: RxBool(true),
    type: 'Additional Customization',
    question: 'Additional Customization(other)',
    consentActivitiesCheck: [],
  );

  static final RxList<ConsentActivitiesData> consentFormData = [
    kissingConsentActivitiesData,
    touchingConsentActivitiesData,
    sexualTouchingConsentActivitiesData,
    oralActivitiesConsentActivitiesData,
    intercourseConsentActivitiesData,
    kinkConsentActivitiesData,
    communicationConsentActivitiesData,
    physicalIntimacyConsentActivitiesData,
    digitalIntimacyConsentActivitiesData,
    experimentalConsentActivitiesData,
    conditionsConsentActivitiesData,
    comfortConsentActivitiesData,
    customizationConsentActivitiesData
  ].obs;

  static final List<Chats> chatsData = [
    Chats(
      profilePic:
          'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740',
      name: 'Bonnie',
      lastMsg: 'Oh i don\'t like fish 🙈',
      lastMsgTime: '11:20 PM',
      newMsgCount: '2',
    ),
    Chats(
      profilePic:
          'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740',
      name: 'Vicki',
      lastMsg: 'Can we go somewhere? ',
      lastMsgTime: '1:20 PM',
      newMsgCount: '8',
    ),
    Chats(
      profilePic:
          'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740',
      name: 'Lilly',
      lastMsg: 'You: If I were a stop light, I’d turn',
      lastMsgTime: '12:00 AM',
      newMsgCount: '12',
    ),
    Chats(
      profilePic:
          'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740',
      name: 'Sarah',
      lastMsg: 'You: How about a movie and then I will',
      lastMsgTime: '8:30 PM',
      newMsgCount: '2',
    ),
    Chats(
      profilePic:
          'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740',
      name: 'Mona',
      lastMsg: 'See you soon 😉',
      lastMsgTime: '8:20 PM',
      newMsgCount: '78',
    ),
    Chats(
      profilePic:
          'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740',
      name: 'lizzie',
      lastMsg: 'Are you serious?!',
      lastMsgTime: '3:50 AM',
      newMsgCount: '56',
    ),
  ];

  static List<Message> messages = [
    Message(
        text: 'Hello 1',
        sender: 'Bonnie',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
    Message(
        text: 'Hi there!',
        sender: 'Vicki',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
    Message(
        text: 'How are you?',
        sender: 'Bonnie',
        timestamp: DateTime.now().subtract(const Duration(minutes: 1))),
    Message(
        text: 'Hello!',
        sender: 'Vicki',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
    Message(
        text: 'Hi there!',
        sender: 'Bonnie',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
    Message(
        text: 'How are you? Last',
        sender: 'Vicki',
        timestamp: DateTime.now().subtract(const Duration(minutes: 1))),
    Message(
        text: 'Hello 1',
        sender: 'Bonnie',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
    Message(
        text: 'Hi there!',
        sender: 'Vicki',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
    Message(
        text: 'How are you?',
        sender: 'Bonnie',
        timestamp: DateTime.now().subtract(const Duration(minutes: 1))),
    Message(
        text: 'Hello!',
        sender: 'Vicki',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
    Message(
        text: 'Hi there!',
        sender: 'Bonnie',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
    Message(
        text: 'How are you? Last',
        sender: 'Vicki',
        timestamp: DateTime.now().subtract(const Duration(minutes: 1))),
  ].obs;

  static AppData of(BuildContext context) => AppData();

  static Future<List<City>> find(String query) async {
    // Mock data
    final List<City> cities = [
      City(name: 'New York', country: 'USA'),
      City(name: 'Los Angeles', country: 'USA'),
      City(name: 'Chicago', country: 'USA'),
      City(name: 'Houston', country: 'USA'),
      City(name: 'Phoenix', country: 'USA'),
      // Add more cities here
    ];
    return cities
        .where((city) => city.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

class ConsentActivitiesData {
  RxBool isSkip;
  String? type;
  String? question;
  List<ConsentActivitiesCheck>? consentActivitiesCheck;

  ConsentActivitiesData(
      {required this.isSkip,
      this.type,
      this.question,
      this.consentActivitiesCheck});
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

class City {
  final String name;
  final String country;

  City({required this.name, required this.country});
}

class Chats {
  final String profilePic;
  final String name;
  final String lastMsg;
  final String newMsgCount;
  final String lastMsgTime;

  Chats({
    required this.profilePic,
    required this.name,
    required this.lastMsg,
    required this.newMsgCount,
    required this.lastMsgTime,
  });
}

class Message {
  String text;
  String sender;
  DateTime timestamp;

  Message({
    required this.text,
    required this.sender,
    required this.timestamp,
  });
}
