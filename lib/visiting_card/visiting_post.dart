import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'card_modal.dart';


class Visiting_Card extends StatefulWidget {
  const Visiting_Card({Key? key}) : super(key: key);

  @override
  State<Visiting_Card> createState() => _Visiting_CardState();
}

class _Visiting_CardState extends State<Visiting_Card> {

  GlobalKey _global = GlobalKey();

  @override
  Widget build(BuildContext context) {

    VisitCard data = ModalRoute.of(context)!.settings.arguments as VisitCard;

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.teal.shade50,
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
          child: RepaintBoundary(
            key: _global,
            child: Stack(
              children: [
                Container(
                height: 250,
                width: 360,
                decoration: BoxDecoration(
                    color: Colors.white,
                 // image: DecorationImage(image: FileImage(File("${data.bgimg}")),fit: BoxFit.cover)
                ),

              ),
                Positioned(
                  top: 23,
                  left: 6,
                  child: Transform.rotate(angle: 0,
                    child: Container(height: 200,width: 182,

                      decoration: BoxDecoration(
                          color: Colors.pink,
                          image: DecorationImage(image: FileImage(File("${data.img}")),fit: BoxFit.fill,),
                          borderRadius: BorderRadius.circular(19)),),
                  ),
                ),
                Container(
                  height: 250,
                  width: 360,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/visiting.png"),fit: BoxFit.fill)
                  ),

                ),
                
                Positioned(top: 26,left: 123,
                child: Transform.rotate(angle: pi/3.8,child: Container(color: Colors.white,height: 37.5,width: 93,))),
                Positioned(left: 175,top: 23,
                    child: Container(height: 20,width: 20,color: Colors.white,)),

                Positioned(top: 148,left: 154,
                    child: Transform.rotate(angle: pi/4.2,child: Container(color: Colors.white,
                      height: 95,width: 20,))),
                Positioned(top: 180,left: 157,
                    child: Transform.rotate(angle: pi/4.2,child: Container(color: Colors.white,
                      height: 53,width: 30,))),




                Positioned(top: 20,right:5,child: Container(width: 220,alignment:Alignment.center,child: Text("${data.name}",style: TextStyle(fontSize:25 ),))),
                Positioned(top: 50,right:5,child: Container(width: 220,alignment:Alignment.center,child: Text("${data.currentposition}",style: TextStyle(fontSize:18 ),))),


                Positioned(left:200,top: 150,child:Container(height:23,width:150,alignment:Alignment.centerLeft,child: Text(" ${data.currentcompany}",style: TextStyle(fontSize: 15),)),),
                Positioned(left:200,top: 170,child: Container(height:23,width:150,alignment:Alignment.centerLeft,child: Text("🚩 ${data.address}",style: TextStyle(fontSize: 11.5),))),
                Positioned(left:200,top: 183,child: Container(height:23,width:150,alignment:Alignment.centerLeft,child: Text("📱 ${data.contact}",style: TextStyle(fontSize: 11.5),))),
                Positioned(left:200,top: 196,child: Container(height:23,width:150,alignment:Alignment.centerLeft,child: Text("📧 ${data.email}",style: TextStyle(fontSize: 11.5),))),
                Positioned(left:200,top: 209,child: Container(height:23,width:150,alignment:Alignment.centerLeft,child: Text("🌐 ${data.website}",style: TextStyle(fontSize: 11.5),))),



                ],
            ),
          ),
        )
      ),
    );
  }
}
