import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class FormEmployeePage extends StatelessWidget {
  const FormEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F8FD),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFF9F8FD),
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Add Employee',
              style: GoogleFonts.poppins(
                color: AppColorStyle.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColorStyle.primary,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        CustomTextField(
                          labelText: 'Name',
                          hintText: 'Enter Name',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Address',
                          hintText: 'Enter Address',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Email',
                          hintText: 'Enter Email',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Birth',
                          hintText: 'Enter Birth',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Department',
                          hintText: 'Enter Department',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Branch',
                          hintText: 'Enter Branch',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Submit',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
