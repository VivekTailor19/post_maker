import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            flexibleSpace: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.indigo])),),
            title: Text("Create Different Profiles",style: TextStyle(fontSize: 25),)),

        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "insta");
                 },

              child: Item("Instagram Story")),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, "linkedin");
                },
              child: Item("Linkedin")),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, "congrats");
              },
              child: Item("Simple")),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, "digitalmarketing");
              },
                  child: Item("Digital Marketing")),


            ],
          ),
        ),
      ),
    );
  }

  Container Item(String item)
  {
    return Container(height: 80,width: 220,alignment: Alignment.center,
      child: Text("$item",style: TextStyle(fontSize: 30,color: Colors.white),textAlign: TextAlign.center),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.lightBlueAccent,offset: Offset(-4, 6))],
          gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.indigo])),
    );
  }
}
