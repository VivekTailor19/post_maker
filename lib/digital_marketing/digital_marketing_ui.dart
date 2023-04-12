import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'digitalmarketing_data.dart';

class Digital_Marketing_Post extends StatefulWidget {
  const Digital_Marketing_Post({Key? key}) : super(key: key);

  @override
  State<Digital_Marketing_Post> createState() => _Digital_Marketing_PostState();
}

class _Digital_Marketing_PostState extends State<Digital_Marketing_Post> {

  GlobalKey _globalKey = GlobalKey();


  @override
  Widget build(BuildContext context) {

    Digital dm = ModalRoute.of(context)!.settings.arguments as Digital;

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.pink.shade50,
          appBar: AppBar(
              toolbarHeight: 80,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.pinkAccent, Colors.teal, Colors.indigo],
                        radius: 10)),
              ),
              title: Text(
                "Digital Marketing Post Maker",
                style: TextStyle(
                    fontFamily: 'deli', fontSize: 25, color: Colors.white),
              ),
              actions: [
                IconButton(icon: Icon(Icons.download_for_offline_outlined),iconSize: 25,color: Colors.tealAccent,
                  onPressed: () async {

                    RenderRepaintBoundary boundary =  _globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
                    var image = await boundary.toImage();
                    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
                    Uint8List uint8List = byteData!.buffer.asUint8List();
                    print(uint8List);

                    await ImageGallerySaver.saveImage(uint8List);


    },
                ),],
                ),



          body: Center(
            child: RepaintBoundary(
              key: _globalKey,
              child: Stack(children: [
              Center(
              child: Container(
              height: 360,
                width: 360,
                color: Color(0xff25273E),
              ),
          ),
                Align(
                  alignment: Alignment(-1.5, -0.5),
                  child: Container(
                      height: 82,
                      width: 360,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/white-elegant-texture-wallpaper_23-2148417584.jpg"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(120))
                  ),
                ),
              ),
                Align(
                  alignment: Alignment(1.5, 0.5),
                  child: Container(
                    height: 82,
                    width: 360,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://img.freepik.com/free-vector/white-elegant-texture-wallpaper_23-2148417584.jpg"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(110))
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.7, 0),
                  child: Container(
                    height: 200,
                    width: 180,
                    color: Colors.yellow,
                  ),
                ),



                Align(alignment: Alignment(-0.6,0),
                  child: Container(height: 250,width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.white,
                        image: DecorationImage(image: FileImage(
                            File("${dm.photo}")),fit: BoxFit.fill),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(35),bottom: Radius.circular(35)),
                        boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5)]
                    ),

                  ),
                ),

                Align(alignment: Alignment(0.9,-0.27),
                    child: Text("Digital",style: TextStyle(color: Colors.white,fontSize: 25),)),
                Align(alignment: Alignment(0.9,-0.19),
                    child: Text("MARKETING",style: TextStyle(color: Colors.white,fontSize: 20),)),

                Align(alignment: Alignment(0.9,-0.12),
                    child: Text("AGENCY",style: TextStyle(color: Colors.white,fontSize: 20),)),
                Align(alignment: Alignment(0.9,0.05),
                  child: Container(width: 130,
                      child: Text("${dm.shortdetail}",style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.right,)),),
                Align(alignment: Alignment(0.9,0.25),
                  child: Container(
                      width: 130, child: Text("${dm.tagline}",style: TextStyle(color: Colors.white,fontSize: 15),textAlign: TextAlign.right,)),),

                Align(alignment: Alignment(0,0.5),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                      onPressed: () {}, child: Text("Join Now"),),),

                Positioned(bottom:160,left: 15,
                  child: Row(children: [
                    Container(height: 30,width: 25,alignment: Alignment.center,color: Colors.amber,
                      child: Icon(Icons.call,size: 22,color: Colors.white,),),
                    SizedBox(width: 5),
                    Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("For more information",style: TextStyle(color: Colors.black45,fontSize: 8),),
                      Text("${dm.phone}",style: TextStyle(color: Colors.black,fontSize: 10),),
                    ],)
                  ],),
                ),
                Positioned(bottom:160,right: 15,
                  child: Row(children: [

                    Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("${dm.website}",style: TextStyle(color: Colors.black45,fontSize: 10),),
                        Text("VISIT OUR WEBSITE",style: TextStyle(color: Colors.black,fontSize: 9,fontWeight: FontWeight.bold),),
                      ],),
                    SizedBox(width: 4),
                    Icon(Icons.language_rounded,color: Colors.amber,size: 30,)
                  ],),
                ),


                  //         style: ElevatedButton.styleFrom(backgroundColor: Colors.amber)
                  //       ),

                  // Align(alignment: Alignment(0.9,0.1),
                  //   child: Text("${dm.tagline}",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.left,),),

                  // Align(alignment: Alignment(0.5,0.5),
                  //   child: Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       ListTile(leading: IconButton(icon: Icon(Icons.call),onPressed: () {},
                  //         color: Colors.white,
                  //       highlightColor: Colors.yellow),),
                  //       ElevatedButton(onPressed: () {}, child: Text("Join Now"),
                  //         style: ElevatedButton.styleFrom(backgroundColor: Colors.amber)
                  //       ),
                  //       ListTile(title: Text("Enter Website"),
                  //       trailing: Icon(Icons.language),)
                  //     ],),
                  //   ),
                  // )



                ],),
            ),)
    ,
    )
    ,
    );
  }
}
/*


Container(
                  height: 360, width: 360,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                      image: NetworkImage("https://img.freepik.com/free-vector/white-elegant-texture-wallpaper_23-2148417584.jpg"),fit: BoxFit.fill)),
                  alignment: Alignment(-0.6,0),),
* */
