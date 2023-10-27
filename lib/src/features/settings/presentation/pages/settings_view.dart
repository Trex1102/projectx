import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectx/src/features/settings/presentation/widgets/icon_text_row.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(411, 823));
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: const Color(0xFF2F2F2F), // Use the specified background color
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            width: 411.w,
            height: 294.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.w),
                  bottomRight: Radius.circular(12.w),
                ),
                color: Colors.blue, // Use the specified top background color
              ),
            ),
          ),
          // Add other widgets on top of the background here
          Positioned(
            top: 128.h,
            left: 16.w, // Adjust left position as needed
            child: SingleChildScrollView(
              child: Container(
                  width: 379.w,
                  height: 911.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.w),
                    color: const Color(0xFF202020),
                    //color: Colors.grey.shade800,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(19, 19, 19, 0.32),
                        offset: Offset(0, 2),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 19.h),
                        Row(

                        ),
                        IconTextRow(text: 'Edit profile', iconPath: 'assets/icons/right_arrow.svg', onTap: (){
                          //
                        }),
                        SizedBox(height: 34.h),
                        IconTextRow(text: 'Change password', iconPath: 'assets/icons/right_arrow.svg', onTap: (){
                          //
                        }),
                        SizedBox(height: 34.h),
                        IconTextRow(text: 'Add a payment method', iconPath: 'assets/icons/plus.svg', onTap: (){
                          //
                        }),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
