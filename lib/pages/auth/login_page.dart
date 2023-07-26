import 'package:bowindo_trial/pages/employee/list_employee_page.dart';
import 'package:bowindo_trial/providers/auth_provider.dart';
import 'package:bowindo_trial/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColorStyle.primary,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                CustomTextField(
                  labelText: 'User ID',
                  hintText: 'Enter your User Id',
                  controller: userIdController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelText: 'Password',
                  hintText: 'Enter your Password',
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 50,
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     padding: const EdgeInsets.symmetric(
                //       vertical: 20,
                //       horizontal: 20,
                //     ),
                //     backgroundColor: AppColorStyle.primary,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     minimumSize: const Size.fromHeight(50),
                //   ),
                //   child: Text(
                //     'Login',
                //     style: GoogleFonts.poppins(
                //       fontSize: 16,
                //       // fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                Consumer<AuthProvider>(
                  builder: (context, authProvider, _) {
                    return authProvider.isLoading
                        ? const CircularProgressIndicator(
                            color: AppColorStyle.primary,
                          )
                        : CustomButton(
                            text: 'Login',
                            onPressed: () async {
                              var userId = userIdController.text;
                              var password = passwordController.text;
                              if (userId.isEmpty || userId.trim() == '') {
                                CustomSnackbar.showError(
                                  context: context,
                                  message: 'User Id tidak boleh kosong',
                                );
                                return;
                              }
                              if (password.isEmpty || password.trim() == '') {
                                CustomSnackbar.showError(
                                  context: context,
                                  message: 'Password tidak boleh kosong',
                                );
                                return;
                              }
                              authProvider.setLoading(true);
                              authProvider
                                  .login(userId, password)
                                  .then((value) {
                                SharedPreferences.getInstance().then(
                                    (sharedPref) => sharedPref.setString(
                                        'token', authProvider.token ?? ''));

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ListEmployeePage(),
                                  ),
                                );
                              }).catchError((e) {
                                CustomSnackbar.showError(
                                  context: context,
                                  message: e.toString(),
                                );
                              }).whenComplete(
                                      () => authProvider.setLoading(false));
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
