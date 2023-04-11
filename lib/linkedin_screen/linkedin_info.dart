
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_ui/linkedin_screen/linkedin_modal.dart';

class Linkedin_Info extends StatefulWidget {
  const Linkedin_Info({Key? key}) : super(key: key);

  @override
  State<Linkedin_Info> createState() => _Linkedin_InfoState();
}

class _Linkedin_InfoState extends State<Linkedin_Info> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtcurrentposition = TextEditingController();
  TextEditingController txtcurrentcompany = TextEditingController();
  TextEditingController txtaddress = TextEditingController();
  TextEditingController txteducation = TextEditingController();
  TextEditingController txtconnection = TextEditingController();
  TextEditingController txtfollower = TextEditingController();
  TextEditingController txttagline = TextEditingController();
  TextEditingController txtlifemoto = TextEditingController();


  String? photo;
  String? bgphoto;


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: RadialGradient(colors: [Colors.blue,Colors.indigo],radius: 10)),),
            title: Text("Linkedin Post Designer",style: TextStyle(fontFamily: 'deli',fontSize: 35,color: Colors.white),)),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
          child: SingleChildScrollView(
            child: Column(

              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text("Upload \n Profile Image",style: TextStyle(fontSize: 18,color: Colors.blue),textAlign: TextAlign.center,),

                    InkWell(
                      onTap: ()   {
                        getimage(true);
                      },
                      child: Container(height: 150,width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.tealAccent.shade100,
                            border: Border.all(color: Colors.teal,width: 3),
                            image: photo == null ?
                            DecorationImage(image: AssetImage("assets/images/addperson.png"),fit: BoxFit.fill,) :
                            DecorationImage(image:FileImage(File("$photo")),fit: BoxFit.fill,)

                        ),

                      ),),


                  ],),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: ()   {
                        getimage(false);
                      },
                      child: Container(height: 150,width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.tealAccent.shade100,
                            border: Border.all(color: Colors.teal,width: 3),
                            image: bgphoto == null ?
                            DecorationImage(image: AssetImage("assets/images/addperson.png"),fit: BoxFit.fill,) :
                            DecorationImage(image:FileImage(File("$bgphoto")),fit: BoxFit.fill,)

                        ),

                      ),),

                    Text("Upload \n Backgrounnd Image",style: TextStyle(fontSize: 18,color: Colors.blue),textAlign: TextAlign.center,),







                  ],),

                SizedBox(height: 10),

                Textediting(hint: "Enter Name .....",controller: txtname,kboard: TextInputType.text),
                Textediting(hint: "Enter Address in short .....",controller: txtaddress,kboard: TextInputType.streetAddress),
                Textediting(hint: "Enter Maximum Education Name .....",controller: txteducation,kboard: TextInputType.text),
                Textediting(hint: "Enter Current Company Name .....",controller: txtcurrentcompany,kboard: TextInputType.text),
                Textediting(hint: "Enter Current Position .....",controller: txtcurrentposition,kboard: TextInputType.text),
                Textediting(hint: "Enter Life moto .....",controller: txtlifemoto,kboard: TextInputType.text),
                Textediting(hint: "Enter Tagline .....",controller: txttagline,kboard: TextInputType.text),
                Textediting(hint: "Enter Total Connections .....",controller: txtconnection,kboard: TextInputType.number),
                Textediting(hint: "Enter Total Followers .....",controller: txtfollower,kboard: TextInputType.number),


                ElevatedButton(onPressed: () {

                  Linkedin data = Linkedin(
                    name: txtname.text,
                    address: txtaddress.text,
                    follower: txtfollower.text,
                    connection: txtconnection.text,
                    currentcompany: txtcurrentcompany.text,
                    currentposition: txtcurrentposition.text,
                    education: txteducation.text,
                    lifemoto: txtlifemoto.text,
                    tagline: txttagline.text
                  );

                  Navigator.pushNamed(context, "linkpost",arguments: data);

                }, child: Text("Create",style: TextStyle(color: Colors.white,fontSize: 25),),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),)




              ],
            ),
          ),
        ),

      ),
    );
  }

  void getimage(bool option)
  {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white70,
        content: Column(
            mainAxisSize:MainAxisSize.min,children: [
          Text("Add Photo",style: TextStyle(color: Colors.pink.shade500),),
          SizedBox(height: 10),
          InkWell(onTap: () async {
            ImagePicker img = ImagePicker();
            XFile? xfile = await img.pickImage(source: ImageSource.camera);

            if(option == true)
              {
                setState(() {
                  photo = xfile!.path;
                });
              }
            else if(option == false)
              {
                setState(() {
                  bgphoto = xfile!.path;
                });
              }

          },
            child: ListTile(

              leading: Icon(Icons.camera_alt_outlined,size: 20,),
              title: Text("Add Photo",style: TextStyle(fontSize: 15),),
            ),
          ),
          InkWell(onTap: () async {
            ImagePicker img = ImagePicker();
            XFile? xfile = await img.pickImage(source: ImageSource.gallery);
            setState(() {
            if(option == true)
            {
                photo = xfile!.path;
            }
            else if(option == false)
            {
                bgphoto = xfile!.path;
            }
            });


          },
            child: ListTile(

              leading: Icon(Icons.add_a_photo_outlined,size: 20,),
              title: Text("From Galary",style: TextStyle(fontSize: 15),),
            ),
          ),

        ]),
      );
    },);
  }

  Widget Textediting(
      {TextEditingController? controller, TextInputType? kboard, String? hint})

  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: kboard,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 15),
          enabled: true,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

        ),

      ),
    );
  }

}












// child: photo1 == null ?
// Icon(Icons.add_a_photo_outlined,size: 80,color: Colors.teal,) :
//   Image.file(File("$photo"),fit: BoxFit.fill,)