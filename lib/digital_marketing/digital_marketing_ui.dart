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
                        image: DecorationImage(image: AssetImage(
                            "assets/images/digitalmarketing.png"),fit: BoxFit.fill),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(35),bottom: Radius.circular(35)),
                        boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5)]
                    ),

                  ),
                ),

                Align(alignment: Alignment(0.9,-0.2),
                    child: Text("Digital",style: TextStyle(color: Colors.white,fontSize: 25),)),
                Align(alignment: Alignment(0.9,-0.15),
                    child: Text("MARKETING",style: TextStyle(color: Colors.white,fontSize: 20),)),

                Align(alignment: Alignment(0.9,-0.1),
                    child: Text("AGENCY",style: TextStyle(color: Colors.white,fontSize: 20),)),
                Align(alignment: Alignment(0.9,0.1),
                  child: Text("${dm.shortdetail}",style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.right,),),
                Align(alignment: Alignment(0.9,0.2),
                  child: Text("${dm.tagline}",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.left,),),

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

        ]),
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
