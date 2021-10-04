  import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix/screen/profl_screen.dart';
import 'package:netflix/widgets/mytextfiled.dart';


    class SignInScreen extends StatefulWidget {
      static const String rout ="signin_screen";
      const SignInScreen({Key? key}) : super(key: key);

      @override
      _SignInScreenState createState() => _SignInScreenState();
    }

    class _SignInScreenState extends State<SignInScreen> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: SvgPicture.asset("images/Netflix_2015_logo.svg", width: 100,)
          ),
          body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextFiled(txt: "Email or phone number",),
              MyTextFiled(txt: "Password",password: true,),
          Container(
            width: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white,width: 1)
            ),
            child: TextButton(
              child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 19),),
              onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Profile_Screen()),(Route<dynamic> route )=> false);
              },
            ),
          )
            ],
          )
        );
      }
    }
