import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'congratulation.dart';

class Sample_Info extends StatefulWidget {
  const Sample_Info({Key? key}) : super(key: key);

  @override
  State<Sample_Info> createState() => _Sample_InfoState();
}

class _Sample_InfoState extends State<Sample_Info> {

  List<Color> colorpallet = [];

  GlobalKey _global = GlobalKey();

  @override
  Widget build(BuildContext context) {

    Congrat cg = ModalRoute.of(context)!.settings.arguments as Congrat;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [

          IconButton(icon: Icon(Icons.download_for_offline_outlined,size: 30,),iconSize: 25,color: Colors.tealAccent,
            onPressed: () async {

              RenderRepaintBoundary boundary =  _global.currentContext!.findRenderObject()! as RenderRepaintBoundary;
              var image = await boundary.toImage();
              ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
              Uint8List uint8List = byteData!.buffer.asUint8List();
              print(uint8List);

              await ImageGallerySaver.saveImage(uint8List);


            },
          ),

        ],),
          body: Center(
        child: Container(height: 360,width: 360,
            decoration: BoxDecoration(color: Colors.amber,border: Border.all(color: Colors.pink,width: 3)),
          child:

            RepaintBoundary(
              key: _global,
              child: Stack(
                  children: [
                    Container(height: 360, width: 360,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/digitalmarketing.png"))
                      ),),
                    //Align(alignment: Alignment(0,-0.5),child: CircleAvatar(radius: 110,backgroundColor: Colors.teal,))



                    cg.path == null ?
                    Positioned(top: 30,left: 60,
                        child: CircleAvatar(radius: 120,backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiaJwH7ITbRv1Gk7RmxjFo74Fbc5r6eC69V06vKIRRpQ&usqp=CAU&ec=48665699"),)) :
                    Positioned(top: 30,left: 60,
                        child: CircleAvatar(radius: 120,backgroundImage: FileImage(File("${cg.path}")),)),


                    Positioned(top: 180,
                      child: Container(height: 360,width: 360,
                        alignment:Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.elliptical(180,150))),),
                    ),
                    Positioned(top: 210,left:65,
                      child: Text("Congratulations",style: TextStyle(fontWeight: FontWeight.bold,wordSpacing: 3,
                          fontFamily: 'deli',fontSize: 45,color: Colors.amberAccent.shade400),),
                    ),
                    Positioned(top: 255,left:95,
                        child: Text("${cg.pretag} ${cg.name}",style: TextStyle(fontSize: 30,wordSpacing: 3,color: Colors.amberAccent.shade700,fontFamily: 'deli'),
                    textAlign: TextAlign.center,)),

                    Positioned(top: 300,left:50,
                        child: Container(width: 260,
                          child: Text("${cg.detail}",style: TextStyle(fontSize: 23,wordSpacing: 3,color: Colors.redAccent.shade400),
                    textAlign: TextAlign.center,),
                        )),


                  ],),
            )


        ),
      )),
    );
  }
}
