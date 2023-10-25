import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _confirmObcureText = true;

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text(
                  'Create an Account',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Please sign up to access and start saving',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 42.h),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: GoogleFonts.poppins(),
                        ),
                        validator: _emailValidator,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      TextFormField(
                        obscureText: _obscureText,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: GoogleFonts.poppins(),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        validator: _passwordValidator,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Confirm Password',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      TextFormField(
                        obscureText: _confirmObcureText,
                        decoration: InputDecoration(
                          hintText: 'Confirm your password',
                          hintStyle: GoogleFonts.poppins(),
                          suffixIcon: IconButton(
                            icon: Icon(_confirmObcureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _confirmObcureText = !_confirmObcureText;
                              });
                            },
                          ),
                        ),
                        validator: _confirmPasswordValidator,
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.go('/login_screen');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 48.h)),
                  ),
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(16),
                    )),
                  ),
                ),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Log in',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.amber),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go('/login_screen');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
