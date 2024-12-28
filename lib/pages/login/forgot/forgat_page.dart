import 'package:flutter/material.dart';
import 'package:samdoctor/pages/login/forgot/verifCode.dart';

class ForgatPage extends StatefulWidget {
  const ForgatPage({super.key});

  @override
  State<ForgatPage> createState() => _ForgatPageState();
}

class _ForgatPageState extends State<ForgatPage> {
  final TextEditingController _emilcontroller = TextEditingController();
  bool _isEmailValid = true;

  bool _isValidEmail(String email) {
    // Emailda @gmail.com bo'lishini tekshiramiz
    return email.isNotEmpty && email.contains('@gmail.com');
  }

  void _sendCode() {
    setState(() {
      _isEmailValid = _isValidEmail(_emilcontroller.text);
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Verifcode();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 250, 250, 250),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Password",
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: <Widget>[
            Text(
              "We need your registration phon number to send you password reset code!",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: _isEmailValid ? Colors.white : Colors.red),
              ),
              child: TextField(
                controller: _emilcontroller,
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: InputBorder.none,
                  hintMaxLines: 50,
                  isDense: false,
                  //labelText: "Name",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _sendCode,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
               width: MediaQuery.of(context).size.width,
                height: 52,
                child: const Center(
                  child: Text(
                    "Send Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
