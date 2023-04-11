import 'package:flutter/material.dart';

class DigitalMarketing extends StatefulWidget {
  const DigitalMarketing({Key? key}) : super(key: key);

  @override
  State<DigitalMarketing> createState() => _DigitalMarketingState();
}

class _DigitalMarketingState extends State<DigitalMarketing> {


  TextEditingController txtname = TextEditingController();
  TextEditingController txtshortdetail = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txttagline = TextEditingController();

  String? photo ;

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                Container(height: 150,width: 150,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    image: DecorationImage(image: AssetImage("assets/images/addperson.png"),fit: BoxFit.cover),
                    shape: BoxShape.circle,

                ),),
                SizedBox(height: 10),
                TextField(

                  controller: txtname,
                decoration: InputDecoration(
                  hintText: "Enter Name....",
                  enabled: true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                ),
                keyboardType: TextInputType.text,
                ),
                SizedBox(height: 10),
                TextField(controller: txttagline,
                decoration: InputDecoration(
                  hintText: "Enter Tagline....",
                  enabled: true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                ),
                keyboardType: TextInputType.text,
                ),
                SizedBox(height: 10),
                TextField(controller: txtshortdetail,
                decoration: InputDecoration(
                  hintText: "Enter Short Detail of Webinar....",
                  enabled: true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                ),
                keyboardType: TextInputType.text,
                ),
                SizedBox(height: 10),
                TextField(controller: txtphone,
                decoration: InputDecoration(
                  hintText: "Enter Contact Number....",
                  enabled: true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                ),
                keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextField(controller: txtemail,
                decoration: InputDecoration(
                  hintText: "Enter Email-Id....",
                  enabled: true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                ),
                keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {

                    Digital dm = Digital();
                    dm = Digital(name: txtname.text,tagline: txttagline.text,shortdetail: txtshortdetail.text,phone: txtphone.text,email: txtemail.text);

                    Navigator.pushNamed(context, "digital",arguments: dm);



                  }, child: Text("Submit",),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),)

              ],
              ),
            ),
          ),
        ),

      ),
    );
  }

}



class Digital
{
  String? name,tagline,shortdetail,phone,email;
  Digital({this.name, this.tagline, this.shortdetail, this.phone, this.email});
}
