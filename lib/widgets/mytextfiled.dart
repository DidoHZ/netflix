import 'package:flutter/material.dart';

class MyTextFiled extends StatefulWidget {
  final String txt;
  bool password;
  MyTextFiled({Key? key, this.txt = "", this.password = false})
      : super(key: key);

  @override
  _MyTextFiledState createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: TextField(
        obscureText: widget.password ? !show : false,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            suffixIcon: widget.password
                ? show
                    ? IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () =>
                            setState(() => show = show ? false : true),
                      )
                    : IconButton(
                        icon: Icon(Icons.visibility_off),
                        onPressed: () =>
                            setState(() => show = show ? false : true),
                      )
                : null,
            labelText: widget.txt,
            fillColor: Color.fromARGB(255, 51, 51, 51),
            filled: true,
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
