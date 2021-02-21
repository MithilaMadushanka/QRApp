import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'genarate.dart';
import 'scan.dart';

class HomePage extends StatefulWidget {
  String dataString;
  HomePage(String qrdata){
      this.dataString = qrdata;
  }

  @override
  _HomePageState createState() => _HomePageState(dataString);
}

class _HomePageState extends State<HomePage> {

  String qrString;
  _HomePageState(String data)
  {
      this.qrString = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Home Panel"),
            centerTitle: false,        ),
        body: Container(

            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20.0),
            child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:  CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Welcome User",textAlign: TextAlign.center,style: TextStyle(fontSize: 24.0,color: Colors.blue),),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text("You can press bellow 'Generate QR button' then you can open QR Code Screen",textAlign: TextAlign.center,style: TextStyle(fontSize: 16.0,),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Icon(Icons.archive,size: 90.0,color: Colors.blue,),
                  //flatButton("Scan QR CODE", ScanPage()),
                  SizedBox(height: 20.0,),
                  flatButton("Generate QR CODE", GeneratrPage(qrString)),
                  SizedBox(height: 10.0,),
                  flatButton("View My Account", ScanPage()),
                  SizedBox(height: 40.0,),
                  Text("Design by Mithila Madushanka",textAlign: TextAlign.center,style: TextStyle(fontSize: 16.0,),),
                ],
            ),
        ),
    );
  }
  Widget flatButton(String text, Widget widget) {
      return FlatButton(
         padding: EdgeInsets.all(15.0),
         onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
            },
          child: Text(
              text,
              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue,width: 3.0),
                borderRadius: BorderRadius.circular(20.0)),
          );
  }
}