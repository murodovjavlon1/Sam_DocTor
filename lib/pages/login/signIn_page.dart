// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:samdoctor/pages/login/forgot/forgat_page.dart';
import 'package:samdoctor/pages/login/signUp_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscured = true;
  bool _isPasswordValid = true;
  bool _isEmailValid = true;

  bool _isValidEmail(String email) {
    // Emailda @gmail.com bo'lishini tekshiramiz
    return email.isNotEmpty && email.contains('@gmail.com');
  }

  // Parol uchun tekshiruv
  bool _isValidPassword(String password) {
    // Parolning uzunligi 8 va undan ko'proq bo'lishi kerak
    return password.isNotEmpty && password.length >= 8;
  }

  void _validateInput() {
    setState(() {
      // Email va parolni tekshiruvdan o'tkazamiz
      _isEmailValid = _isValidEmail(_emailController.text);
      _isPasswordValid = _isValidPassword(_passwordController.text);
    });

    // Agar ikkala maydon ham to'g'ri bo'lsa
    if (_isEmailValid && _isPasswordValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Tizimga muvaffaqiyatli kirildi!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Iltimos, barcha maydonlarni to'ldiring!")),
      );
    }
  }

  void _isForgot() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ForgatPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 250, 250, 250),
      appBar: AppBar(
         centerTitle: true,
        title: 
           Text(
            "Let's Sing In",
            style: TextStyle(
              fontWeight: FontWeight.bold,
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
                "Welcome!",
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
                      color: _isEmailValid ? Colors.white : Colors.red),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                      hintMaxLines: 50,
                      isDense: false,
                      //labelText: "Name",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 12,
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
                  controller: _passwordController,
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
              GestureDetector(
                onTap: _isForgot,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              GestureDetector(
                onTap: _validateInput,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      width: 342,
                      height: 52, //104
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
                  const Text("Don’t have an account?"),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignupPage();
                      }));
                    },
                    child: const Text(
                      "Sign Up",
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
