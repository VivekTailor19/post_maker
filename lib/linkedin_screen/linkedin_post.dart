import 'package:flutter/material.dart';
import 'package:profile_ui/linkedin_screen/linkedin_modal.dart';

class Linkedin_Post extends StatefulWidget {
  const Linkedin_Post({Key? key}) : super(key: key);

  @override
  State<Linkedin_Post> createState() => _Linkedin_PostState();
}

class _Linkedin_PostState extends State<Linkedin_Post> {
  @override
  Widget build(BuildContext context) {
    Linkedin data = ModalRoute.of(context)!.settings.arguments as Linkedin;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
          Container(
            height: 300,
            width: 350,
            color: Colors.black12,
            child: Column(
              children: [
                Container(
                  height: 120,
                  color: Colors.pink,

                ),
                Container(
                  height: 180,
                  color: Colors.yellow,
                )
              ],
            ),
          ),
          Container(alignment: Alignment(-0.75,-0.1),child: CircleAvatar(radius: 40,backgroundColor: Colors.brown,))
        ],),
      ),
    );
  }
}
