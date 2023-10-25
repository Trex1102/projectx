import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double topPadding = screenHeight / 2;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding:
              EdgeInsets.only(left: 23.w, right: 23.w, bottom: 23.w, top: 23.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: (topPadding - 300).h),
                Image.asset(
                  'assets/logo/logo512.png', // Add your splash screen image asset path
                  width: 200.w,
                  height: 200.h,
                ),
                SizedBox(height: 200.h),
                Center(
                  child: Text(
                    'Your on the go, friendly \n expense tracker',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: ScreenUtil().setSp(26),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Fintracker is here to save your money',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add the action you want to perform when the button is pressed.
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 10.h),
                      // Adjust the button size as needed
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(16),
                          color: Colors.white.withOpacity(1),
                        ),
                      ),
                    ),
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
