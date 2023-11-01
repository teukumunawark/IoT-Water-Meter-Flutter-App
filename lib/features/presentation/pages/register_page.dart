import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/app_colors.dart';
import '../../routes/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final confirmpasswordController = TextEditingController(text: '');

  bool isVisible = false;
  bool isConfirmVisible = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final allFieldGap = height * 0.009;

    Widget registerTextHeader() {
      return Padding(
        padding: EdgeInsets.only(top: height * 0.06, bottom: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create an account",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1, top: 2),
              child: Text(
                "Please fill in to sign up new account",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() => Padding(
          padding: EdgeInsets.only(top: allFieldGap),
          child: CustomOutlineTextField(
            label: "NAME",
            hintText: "Username",
            controller: usernameController,
            prefixIcon: const Icon(Icons.person_rounded),
          ),
        );
    Widget emailInput() => Padding(
          padding: EdgeInsets.only(top: allFieldGap),
          child: CustomOutlineTextField(
            label: "EMAIL",
            hintText: "Email Address",
            controller: emailController,
            prefixIcon: const Icon(Icons.email_rounded),
          ),
        );
    Widget passwordInput() => Padding(
          padding: EdgeInsets.only(top: allFieldGap),
          child: CustomOutlineTextField(
            label: "PASSWORD",
            hintText: "Password",
            controller: passwordController,
            prefixIcon: const Icon(Icons.lock_rounded),
            suffixIcon: IconButton(
              onPressed: () {
                if (mounted) {
                  setState(() {
                    isVisible = !isVisible;
                  });
                }
              },
              icon: !isVisible
                  ? const Icon(
                      Icons.visibility_off_sharp,
                    )
                  : const Icon(Icons.visibility),
            ),
            obscureText: !isVisible,
          ),
        );
    Widget confirmpassInput() => Padding(
          padding: EdgeInsets.only(top: allFieldGap),
          child: CustomOutlineTextField(
            label: "CONFIRM PASSWORD",
            hintText: "Confirm Password",
            controller: confirmpasswordController,
            prefixIcon: const Icon(Icons.lock_rounded),
            suffixIcon: IconButton(
              onPressed: () {
                if (mounted) {
                  setState(() {
                    isConfirmVisible = !isConfirmVisible;
                  });
                }
              },
              icon: !isConfirmVisible
                  ? const Icon(
                      Icons.visibility_off_sharp,
                    )
                  : const Icon(Icons.visibility),
            ),
            obscureText: !isConfirmVisible,
          ),
        );

    Widget buttonSubmit() {
      return Padding(
        padding: EdgeInsets.only(top: height * 0.04),
        child: CustomButton(
          title: "Sign Up",
          onPressed: () {
            router.goNamed('home');
          },
        ),
      );
    }

    Widget textButton() => Padding(
          padding: const EdgeInsets.only(bottom: 35),
          child: CustomTextButton(
            title: "Already have an account? ",
            textBtn: "Login",
            onTap: () {
              router.pushNamed('login');
            },
          ),
        );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              registerTextHeader(),
              usernameInput(),
              emailInput(),
              passwordInput(),
              confirmpassInput(),
              buttonSubmit(),
              const Spacer(),
              textButton(),
            ],
          ),
        ),
      ),
    );
  }

  // void hendleRegister(BuildContext context) {
  //   UserModel userController = UserModel(
  //     username: usernameController.text,
  //     email: emailController.text,
  //     password: passwordController.text,
  //     role: dropdownValue,
  //   );

  //   if (usernameController.text.isEmpty) {
  //     const snackbar = SnackBar(content: Text('Nama belum di isi'));
  //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
  //   } else if (emailController.text.isEmpty) {
  //     const snackbar = SnackBar(content: Text('Email belum di isi'));
  //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
  //   } else if (passwordController.text.isEmpty) {
  //     const snackbar = SnackBar(content: Text('Password belum di isi'));
  //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
  //   } else if (passwordController.text != confirmpasswordController.text) {
  //     const snackbar = SnackBar(content: Text('Password Tidak Cocok'));
  //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
  //   } else {
  //     context.read<AuthBloc>().add(AuthEvent.register(user: userController));
  //   }
  // }

  // void hendleError(BuildContext context, message) {
  //   final snackbar = SnackBar(content: Text(message));
  //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
  //   if (mounted) {
  //     setState(() {
  //       usernameController.text = '';
  //       emailController.text = '';
  //       passwordController.text = '';
  //       confirmpasswordController.text = '';
  //     });
  //   }
  // }

  // @override
  // void dispose() {
  //   usernameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   confirmpasswordController.dispose();
  //   super.dispose();
  // }
}
