//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratrPage extends StatefulWidget {
  String qrString;
  GeneratrPage(String qrString)
  {
      this.qrString = qrString;
  }

  @override
  _GeneratrPageState createState() => _GeneratrPageState(qrString);
}

class _GeneratrPageState extends State<GeneratrPage> {
  String qrdata="";
  _GeneratrPageState(String data)
  {
      qrdata = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("QR Generator"),
            actions: [

            ],
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    QrImage(data: qrdata,),
                    SizedBox(height: 40.0,),
                    //Text("New QR Link Generator",style: TextStyle(fontSize: 20.0),),
                    //TextField(controller: qrdatafeed,decoration: InputDecoration(hintText: "Enter your link"),),
                    Padding(
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child: FlatButton(
                            padding: EdgeInsets.all(15.0),
                            onPressed: () async {
                                if(qrdatafeed.text.isEmpty){
                                    setState(() {
                                        qrdata="";
                                    });
                                }
                                else{
                                    setState(() {
                                        qrdata = qrdatafeed.text;
                                    });
                                }
                            },

                        ),

                    ),

                ],
            ),
        ),
    );
  }
  final qrdatafeed = TextEditingController();
}
