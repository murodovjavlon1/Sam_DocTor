// import 'package:flutter/material.dart';
// import 'package:samdoctor/pages/login/signIn_page.dart';

// class Reset extends StatefulWidget {
//   const Reset({super.key});

//   @override
//   State<Reset> createState() => _ResetState();
// }

// class _ResetState extends State<Reset> {
//   final TextEditingController _newController = TextEditingController();
//   final TextEditingController _confirmController = TextEditingController();

//   bool _isObscured = true;
//   bool _isObcure = true;
//   bool _isField1Invalid = false;
//   bool _isField2Invalid = false;

//   bool _isPasswordValid = true;

//   void _checkInputs() {
//     setState(() {
//       _isField1Invalid = false;
//       _isField2Invalid = false;
//     });

//     if (_newController.text.isNotEmpty &&
//         _newController.text == _confirmController.text) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => SigninPage()),
//       );
//     } else {
//       setState(() {
//         if (_newController.text != _confirmController.text) {
//           _isField1Invalid = true;
//           _isField2Invalid = true;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(250, 250, 250, 250),
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Reset Password"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(top: 30),
//           margin: const EdgeInsets.symmetric(horizontal: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 "Enter a new password",
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(
//                 height: 110,
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15,
//                   vertical: 3,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color.fromRGBO(255, 255, 255, 1),
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                       color: _isPasswordValid ? Colors.white : Colors.red),
//                 ),
//                 child: TextField(
//                   controller: _newController,
//                   obscureText: _isObscured,
//                   decoration: InputDecoration(
//                     hintText: "New Password",
//                     errorText:
//                         _isField1Invalid ? 'Ma\'lumotlar mos emas!' : null,
//                     border: InputBorder.none,
//                     hintMaxLines: 50,
//                     isDense: false,
//                     labelStyle: const TextStyle(color: Colors.black),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _isObscured = !_isObscured;
//                         });
//                       },
//                       icon: Icon(
//                         _isObscured ? Icons.visibility_off : Icons.visibility,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15,
//                   vertical: 3,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color.fromRGBO(255, 255, 255, 1),
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                       color: _isPasswordValid ? Colors.white : Colors.red),
//                 ),
//                 child: TextField(
//                   controller: _confirmController,
//                   obscureText: _isObcure,
//                   decoration: InputDecoration(
//                     hintText: "Confirm Password",
//                     errorText:
//                         _isField2Invalid ? 'Ma\'lumotlar mos emas!' : null,
//                     border: InputBorder.none,
//                     hintMaxLines: 50,
//                     isDense: false,
//                     labelStyle: const TextStyle(color: Colors.black),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _isObcure = !_isObcure;
//                         });
//                       },
//                       icon: Icon(
//                         _isObcure ? Icons.visibility_off : Icons.visibility,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               GestureDetector(
//                 onTap: _checkInputs,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 52,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.blue,
//                   ),
//                   child: Center(
//                       child: Text(
//                     "Confirm",
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   )),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:samdoctor/pages/login/signIn_page.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool _isObscuredNew = true;
  bool _isObscuredConfirm = true;
  bool _isField1Invalid = false;
  bool _isField2Invalid = false;

  void _checkInputs() {
    setState(() {
      _isField1Invalid = _newController.text.isEmpty ||
          _newController.text != _confirmController.text;
      _isField2Invalid = _confirmController.text.isEmpty ||
          _newController.text != _confirmController.text;
    });

    if (!_isField1Invalid && !_isField2Invalid) {
      Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SigninPage()),
              (route) => false, // Barcha eski sahifalarni yo'q qiladi
            );
    }
  }

  Widget _buildPasswordField({
    required String hintText,
    required TextEditingController controller,
    required bool isObscured,
    required VoidCallback onVisibilityToggle,
    required bool isInvalid,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isInvalid ? Colors.red : Colors.grey.shade300,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscured,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: onVisibilityToggle,
            icon: Icon(
              isObscured ? Icons.visibility_off : Icons.visibility,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFAFAFAFA),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reset Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Enter a new password",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              _buildPasswordField(
                hintText: "New Password",
                controller: _newController,
                isObscured: _isObscuredNew,
                onVisibilityToggle: () {
                  setState(() {
                    _isObscuredNew = !_isObscuredNew;
                  });
                },
                isInvalid: _isField1Invalid,
              ),
              const SizedBox(height: 20),
              _buildPasswordField(
                hintText: "Confirm Password",
                controller: _confirmController,
                isObscured: _isObscuredConfirm,
                onVisibilityToggle: () {
                  setState(() {
                    _isObscuredConfirm = !_isObscuredConfirm;
                  });
                },
                isInvalid: _isField2Invalid,
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: _checkInputs,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
