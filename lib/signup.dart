import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_chilla/design.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Center(
                          child: Text(
                            'Create Account',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  color: Color(0xFF57CC99),
                                  fontFamily:
                                      GoogleFonts.anekGurmukhi().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0,
                                ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        _buildLabelText(context, "User Name"),
                        const SizedBox(height: 2),
                        _buildProjectedTextFormField(isPassword: false),
                        const SizedBox(height: 20),
                        _buildLabelText(context, "Email"),
                        const SizedBox(height: 2),
                        _buildProjectedTextFormField(isPassword: false),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLabelText(context, "Password"),
                            IconButton(
                              icon: Icon(
                                color: Color(0xFF838181),
                                _isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        _buildPasswordField(),
                        const SizedBox(height: 40),
                        Center(
                          child: SizedBox(
                            height: 48.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF57CC99),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: GoogleFonts.signika().fontFamily,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight - 400,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: BottomWaveClipper(),
                        child: Container(
                          width: double.infinity,
                          color: Color(0xFFC7F9DE),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/image.png',
                          height: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 48.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Sign in with ",
                                        style: TextStyle(
                                          color: const Color(0xFF57CC99),
                                          fontSize: 20,
                                          fontFamily:
                                              GoogleFonts.signika().fontFamily,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Image.asset(
                                        'assets/google_logo.png',
                                        height: 30.0,
                                        width: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    color: const Color(0xFF38A3A5),
                                    fontSize: 18,
                                    fontFamily:
                                        GoogleFonts.robotoFlex().fontFamily,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Sign in',
                                      style: TextStyle(
                                        color: const Color(0xFF296685),
                                        fontWeight: FontWeight.normal,
                                        fontFamily:
                                            GoogleFonts.robotoFlex().fontFamily,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabelText(BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        labelText,
        style: TextStyle(
          color: Color(0xFF838181),
          fontSize: 16,
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
      ),
    );
  }

  Widget _buildProjectedTextFormField({required bool isPassword}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextFormField(
          cursorColor: Color(0xFF838181),
          obscureText: isPassword ? !_isPasswordVisible : false,
          decoration: const InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.red,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return _buildProjectedTextFormField(isPassword: true);
  }
}
