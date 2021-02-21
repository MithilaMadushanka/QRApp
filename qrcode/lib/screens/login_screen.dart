import 'package:flutter/material.dart';
import 'package:qrcode/homepage.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email;
  String password;
  String qrdata = "Pabuwa";
  //controllers
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
                Container(height: double.infinity,width: double.infinity, decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,colors: [
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
                    ],
                    stops: [0.1,0.4,0.7,0.9],
                    ),
                ),),
                Container(
                    height: double.infinity,
                    child: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 120.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                                "Sign In",
                                style: TextStyle(color:Colors.white,fontFamily: 'OpenSans',fontSize: 30.0,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                                height: 10.0,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                    SizedBox(height: 16.0,),
                                    Icon(
                                        Icons.verified_user,
                                        color: Colors.white,
                                        size: 35.0,

                                    ),
                                    SizedBox(height: 45.0,),
                                    TextField(

                                        keyboardType: TextInputType.emailAddress,
                                        controller: emailController,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.email,color: Colors.white,),
                                            fillColor: Colors.white,hintText: "Your Email Address",
                                            hintStyle: TextStyle(color: Colors.white),
                                            filled: false,
                                            hoverColor: Colors.white,
                                            errorText: validEmail(emailController.text,0),
                                            border: new OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                                borderSide: const BorderSide(color: Colors.white,width: 2.0),
                                            ),
                                        ),

                                        style: TextStyle(decorationThickness: 0.0,color: Colors.white),
                                    ),
                                    SizedBox(height: 10.0,),
                                    TextField(
                                        keyboardType: TextInputType.emailAddress,
                                        obscureText: true,
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock,color: Colors.white,),
                                            fillColor: Colors.white,hintText: "Your Password",
                                            errorText: validPassword(passwordController.text,0),

                                            hintStyle: TextStyle(color: Colors.white),
                                            filled: false,
                                             hoverColor: Colors.white,
                                             border: new OutlineInputBorder(
                                             borderRadius: BorderRadius.all(Radius.circular(13.0)),
                                                 borderSide: const BorderSide(color: Colors.white,width: 2.0),
                                       ),
                                    ),

                                    style: TextStyle(decorationThickness: 0.0,color: Colors.white),
                                  ),
                                   SizedBox(height: 35.0,),
                                    SizedBox(
                                        height: 50.0,
                                        width: double.infinity,
                                        child: FlatButton(

                                            child: Text("Sign In",style: TextStyle(fontSize: 16.0),),
                                            color: Colors.white,
                                            textColor: Colors.blue,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),

                                            onPressed: (){
                                                 setState(() {
                                                     email = emailController.text;
                                                     password = passwordController.text;
                                                     validEmail(emailController.text, 1);
                                                     validPassword(passwordController.text, 1);
                                                     validEmail(emailController.text, 2);
                                                 });

                                                 if(email == "admin@gmail.com" && password == "1234")
                                                 {
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(qrdata)));
                                                 }
                                            },
                                        ),

                                    ),
                                    SizedBox(height: 15.0,),

                                ],
                            )
                        ],
                    ),
                    ),

                ),
            ],
        ),
    );
  }

  validEmail(String text , int flag) {
      if(text.isEmpty && flag !=0)
        return "You have to mention email";
      if(text.isEmpty || flag ==1)
        return "You have to mention email";

      if(EmailValidator.validate(text) || flag==2)
        return "";
      else
        return "Please enter valid email";
  }

  validPassword(String text , int flag) {
    if(text.isEmpty && flag!=0)
      return "You have to mention password";
    if(text.isEmpty || flag ==1)
      return "You have to mention password";
  }

  


}
