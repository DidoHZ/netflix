import 'package:flutter/material.dart';

class MyTextFiled extends StatefulWidget {
  final String txt;

  MyTextFiled({Key? key, this.txt = "", this.password = false})
      : super(key: key);

  bool password;
  
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
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
            suffixIcon: widget.password
                ? show
                    ? IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () =>
                            setState(() => show = show ? false : true),
                      )
                    : IconButton(
                        icon: const Icon(Icons.visibility_off),
                        onPressed: () =>
                            setState(() => show = show ? false : true),
                      )
                : null,
            labelText: widget.txt,
            fillColor: const Color.fromARGB(255, 51, 51, 51),
            filled: true,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
