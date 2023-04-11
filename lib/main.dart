// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:stories_editor/stories_editor.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter stories editor Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Example(),
//     );
//   }
// }
//
// class Example extends StatefulWidget {
//   const Example({Key? key}) : super(key: key);
//
//   @override
//   State<Example> createState() => _ExampleState();
// }
//
// class _ExampleState extends State<Example> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         resizeToAvoidBottomInset: false,
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => StoriesEditor(
//                         giphyKey: 'C4dMA7Q19nqEGdpfj82T8ssbOeZIylD4',
//                         //fontFamilyList: const ['Shizuru', 'Aladin'],
//                         galleryThumbnailQuality: 300,
//                         //isCustomFontList: true,
//                         onDone: (uri) {
//                           debugPrint(uri);
//                           Share.shareFiles([uri]);
//                         },
//                       )));
//             },
//             child: const Text('Open Stories Editor'),
//           ),
//         ));
//   }
// }
//













import 'package:flutter/material.dart';

import 'package:profile_ui/homescreen.dart';
import 'package:profile_ui/insta_screen/insta_info.dart';
import 'package:profile_ui/linkedin_screen/linkedin_info.dart';
import 'package:profile_ui/linkedin_screen/linkedin_post.dart';
import 'package:profile_ui/sample_screen/congratulation.dart';
import 'package:profile_ui/sample_screen/sample_info.dart';

import 'digital_marketing/digital_marketing_ui.dart';
import 'digital_marketing/digitalmarketing_data.dart';



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => HomeScreen(),

        "insta":(context) => Insta_Info(),


        "linkedin":(context) => Linkedin_Info(),
        "linkpost":(context) => Linkedin_Post(),

        "congrats":(context) => Congrats(),
        "sample":(context) => Sample_Info(),


        "digital":(context) => Digital_Marketing_Post(),
        "digitalmarketing":(context) => DigitalMarketing(),





      },
    ),
  );
}

//
//
// /*
//
// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
//     <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
//     <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />
//     <uses-permission android:name="android.permission.INTERNET" />
//     <uses-permission android:name="android.permission.VIBRATE"/>
//
// * */