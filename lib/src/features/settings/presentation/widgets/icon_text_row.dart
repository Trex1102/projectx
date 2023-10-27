import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IconTextRow extends StatelessWidget {
  final String text;
  final String iconPath;
  final Function onTap;

  IconTextRow({
    required this.text,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: ScreenUtil().setSp(18),
              color: Colors.white.withOpacity(1),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            onTap();
                    },
          child: SvgPicture.asset(
            iconPath,
            color: Colors.white.withOpacity(1),
            height: 24.h,
            width: 24.w,
          ),
        ),
      ],
    );
  }
}
