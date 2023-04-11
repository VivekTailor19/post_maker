import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stories_editor/stories_editor.dart';

class Insta_Info extends StatefulWidget {
  const Insta_Info({Key? key}) : super(key: key);

  @override

  State<Insta_Info> createState() => _Insta_InfoState();
}

class _Insta_InfoState extends State<Insta_Info> {

  List<Color> colorlist = [Colors.amber,Colors.yellow,Colors.green,Colors.white,Colors.red,Colors.pink,Colors.indigo,Colors.black,Colors.blue,Colors.lightBlueAccent,Colors.teal,Colors.tealAccent,Colors.orange,Colors.deepOrange,Colors.purpleAccent,Colors.deepPurple];

  List<List<Color>> gradientlist = [
    [Colors.orange,Colors.white,Colors.green],
    [Colors.red,Colors.white,Colors.red],
    [Colors.pinkAccent,Colors.indigo],
    [Colors.yellowAccent,Colors.black],
    [Colors.teal,Colors.lightBlue],
    [Colors.white,Colors.red,Colors.white],
    [Colors.blueGrey,Colors.blue.shade50,Colors.blue.shade900]
  ];

  List<String> fontlist = [
    'assets/fonts/delicious.ttf',
    'assets/fonts/amelinda.ttf',
    'assets/fonts/eatday.ttf',
    'assets/fonts/fire.ttf',
    'assets/fonts/october.ttf',
    'assets/fonts/plank.TTF',
    'assets/fonts/snow.ttf',
    'assets/fonts/spring.ttf',

    ];
  List<String> fonts = ['eatday.ttf','fire.ttf'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Hello",style: TextStyle(fontFamily: 'fire'),),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           //SizedBox(height: 15),
            StoriesEditor(
                giphyKey:'C4dMA7Q19nqEGdpfj82T8ssbOeZIylD4',
                onDone: (uri) {},
                colorList: colorlist,
               // fontFamilyList: fonts,
                gradientColors: gradientlist,


            ),
          ],
        ),
      ),


    );
  }
}
