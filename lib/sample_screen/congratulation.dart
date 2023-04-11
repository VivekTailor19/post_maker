import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Congrats extends StatefulWidget {
  const Congrats({Key? key}) : super(key: key);

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtfor = TextEditingController();

  String? path;

  List pretag = ['Mr.','Mrs.'];
  String selecttag = "Mr.";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Congratulation Post"),),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      path == null ? Container(height: 90,width: 90,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          image: DecorationImage(image: AssetImage("assets/images/addperson.png"),fit: BoxFit.cover),
                          shape: BoxShape.circle,

                        ),) : Container(height: 90,width: 90,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          image: DecorationImage(image: FileImage(File("$path")),fit: BoxFit.cover),
                          shape: BoxShape.circle,

                        ),),

                      Column(children: [
                        TextButton(onPressed: () async {
                          ImagePicker img = ImagePicker();
                          XFile? photo = await img.pickImage(source: ImageSource.camera);
                          setState(() {
                            path = photo!.path;
                          });

                          path = photo!.path;
                          print(path);


                        }, child: Text("Capture",style: TextStyle(color: Colors.indigo),),style: TextButton.styleFrom(backgroundColor: Colors.yellow)),
                        TextButton(onPressed: () async {
                          ImagePicker img = ImagePicker();
                          XFile? photo = await img.pickImage(source: ImageSource.gallery);

                          setState(() {
                            path = photo!.path;
                          });
                          print(path);


                        }, child: Text("Gallery",style: TextStyle(color: Colors.indigo),),style: TextButton.styleFrom(backgroundColor: Colors.yellow)),

                      ],)
                    ],
                  ),
                  SizedBox(height: 30),

                  Container(height: 40,width: 80,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),

                    child: DropdownButtonFormField(


                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        enabled: true,
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(10)),
                      ),
                      dropdownColor: Colors.white,

                      items:[
                      DropdownMenuItem(child: Text("Mr."),value: "Mr.",),
                      DropdownMenuItem(child: Text("Mrs."),value: "Mrs.",),
                    ],
                      isExpanded: true,

                      onChanged: (value) {
                        setState(() {
                          selecttag = value as String;

                        });
                        print(selecttag);

                        },
                      value: selecttag,





                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      controller: txtname,
                      style: TextStyle(fontSize: 25,color: Colors.cyan.shade900),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.lightBlue.shade50,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.green.shade50)),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red.shade50)),
                        hintText: "Enter Name and Surname sequentially.....",
                        hintStyle: TextStyle(wordSpacing: 3,letterSpacing: 2,fontSize: 12),

                      ),
                    ),
                  ),
                  SizedBox(height: 15),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      controller: txtfor,
                      style: TextStyle(fontSize: 25,color: Colors.cyan.shade900),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.lightBlue.shade50,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.green.shade50)),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red.shade50)),
                        hintText: "Enter in Details....",
                        hintStyle: TextStyle(wordSpacing: 3,letterSpacing: 2,fontSize: 12),

                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan,),
                      onPressed: () {

                        Congrat congrat = Congrat(pretag: selecttag,detail: txtfor.text,name:txtname.text ,path: path);


                        Navigator.pushNamed(context, "sample",arguments: congrat);

                  }, child: Text("Create",style: TextStyle(fontSize: 25,color: Colors.black45,letterSpacing: 2),))



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Congrat
{
  String? pretag,name,detail,path;
  Congrat({this.pretag, this.name, this.detail, this.path});

}
