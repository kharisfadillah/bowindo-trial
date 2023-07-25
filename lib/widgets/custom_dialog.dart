import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/colors.dart';

class CustomDialog {
  static Future<bool?> yesNo({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
          content: Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColorStyle.primary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: AppColorStyle.primaryLight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 8,
                ),
              ),
              child: Text(
                'No',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColorStyle.primary,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.red.shade100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 8,
                ),
              ),
              child: Text(
                'Yes',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ),
          ],
          actionsPadding: const EdgeInsets.only(
            bottom: 20,
            right: 20,
          ),
        );
      },
    );
  }
}
