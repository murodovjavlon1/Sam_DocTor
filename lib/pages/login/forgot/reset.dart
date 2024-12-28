
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
