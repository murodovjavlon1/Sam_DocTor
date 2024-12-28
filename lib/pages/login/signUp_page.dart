import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emilcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isObscured = true;
  bool _isPasswordValid = true;
  bool _isEmailValid = true;
  // ignore: unused_field
  bool _isNameValid = true;

  bool _isValidEmail(String email) {
    // Emailda @gmail.com bo'lishini tekshiramiz
    return email.isNotEmpty && email.contains('@gmail.com');
  }

  bool _isValidPassword(String password) {
    // Parolning uzunligi 8 va undan ko'proq bo'lishi kerak
    return password.isNotEmpty && password.length >= 8;
  }

  bool _isValidName(String name) {
    return name.isEmpty;
  }

  //  void _validateInput() {
  //   setState(() {
  //     // Email va parolni tekshiruvdan o'tkazamiz
  //     _isEmailValid = _isValidEmail(_emilcontroller.text);
  //     _isPasswordValid = _isValidPassword(_passwordcontroller.text);
  //   });

  void _isSignIn() {
    setState(() {
      _isNameValid = _isValidName(_namecontroller.text);
      _isEmailValid = _isValidEmail(_emilcontroller.text);
      _isPasswordValid = _isValidPassword(_passwordcontroller.text);
    });
    String email = _emilcontroller.text;
    if (email.contains("@gmail.com")) {
    
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos, email toʻgʻri kiriting!"),
        ),
      );
    }
    print("+++++++++++");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
         centerTitle: true,
        title:
          Text(
            "Let's Sign Up ",
            style: TextStyle(
              fontSize: 21,
            ),
          ),
        //),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Text(
                " Create \n Account!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                ),
              ),
              const SizedBox(
                height: 60,
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
                      color: _isPasswordValid ? Colors.white : Colors.red),
                ),
                child: TextField(
                  controller: _namecontroller,
                  decoration: const InputDecoration(
                      hintText: "Name",
                      border: InputBorder.none,
                      hintMaxLines: 50,
                      isDense: false,
                      //labelText: "Name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 15,
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
              const SizedBox(
                height: 15,
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
                  controller: _passwordcontroller,
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    hintMaxLines: 50,
                    isDense: false,
                    labelStyle: const TextStyle(color: Colors.black),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const SizedBox(
                height: 90,
              ),
              GestureDetector(
                onTap: _isSignIn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      width: 342,
                      height: 52,
                      child: const Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account? "),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      //pushReplacement
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
