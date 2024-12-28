import 'package:flutter/material.dart';

class Verifcode extends StatefulWidget {
  const Verifcode({super.key});

  @override
  State<Verifcode> createState() => _VerifcodeState();
}

class _VerifcodeState extends State<Verifcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 35),
          child: Text("Verification Code"),
        ),
      ),
      body:Container(
        
      ),
    );
  }
}
