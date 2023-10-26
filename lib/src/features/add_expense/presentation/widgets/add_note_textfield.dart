import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the Google Fonts package

class AddNoteTextField extends StatelessWidget {
  final TextEditingController controller;

  const AddNoteTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.h), // Use screenutil for padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: ThemeData(
              primarySwatch: Colors.blue, // Set the primary color to amber
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: 'Add Note',
                labelStyle: GoogleFonts.poppins( // Apply the "Poppins" font
                  textStyle: TextStyle(
                    fontSize: 13.sp, // Adjust font size
                    color: Colors.white, // Adjust text color
                    // fontFamily: 'MPlusRounded1c', // You can remove this line
                  ),
                ),
                contentPadding: const EdgeInsets.only(bottom: 0.0), // Adjust the padding to reduce the distance
              ),
            ),
          ),
        ],
      ),
    );
  }
}
