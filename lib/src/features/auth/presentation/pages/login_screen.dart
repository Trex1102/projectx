import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

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
                //SvgPicture.asset('assets/logo/logo.svg'),
                SizedBox(height: 16.h),
                Text(
                  'Welcome back!',
                  style: GoogleFonts.poppins(
                    // Apply Google Fonts Poppins
                    textStyle:
                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Please login to access and start saving',
                  style: GoogleFonts.poppins(
                    // Apply Google Fonts Poppins
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
                          // Apply Google Fonts Poppins
                          textStyle: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: GoogleFonts
                              .poppins(), // Apply Google Fonts Poppins
                        ),
                        validator: _emailValidator,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                          // Apply Google Fonts Poppins
                          textStyle: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      TextFormField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: GoogleFonts
                              .poppins(), // Apply Google Fonts Poppins
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            context.push('/forgot_password_screen');
                          },
                          child: Text(
                            'Forgot password?',
                            style: GoogleFonts.poppins(
                              // Apply Google Fonts Poppins
                              textStyle: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 48.h)),
                  ),
                  child: Text(
                    'Log in',
                    style: GoogleFonts.poppins(
                        // Apply Google Fonts Poppins
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(16),
                    )),
                  ),
                ),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.poppins(
                      // Apply Google Fonts Poppins
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign up',
                        style: GoogleFonts.poppins(
                          // Apply Google Fonts Poppins
                          textStyle: const TextStyle(color: Colors.blue),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //context.push('/signup_screen');
                            context.go('/home');
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
