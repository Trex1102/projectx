import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    required this.navigationShell,
    super.key,
  });
  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: GNav(
            backgroundColor: Colors.black,
            gap: 8.w,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(16.w),
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
              _goBranch(selectedIndex);
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                textStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 14.sp), 
                ),
              ),
              GButton(
                icon: Icons.pie_chart,
                text: 'Statistics',
                textStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 14.sp), 
                ),
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
                textStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 14.sp),
                ),
              )
            ]),
      ),
    );
  }
}
