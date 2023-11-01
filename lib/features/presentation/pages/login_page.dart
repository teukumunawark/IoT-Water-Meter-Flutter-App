import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/app_colors.dart';
import '../../routes/routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final allFieldGap = height * 0.009;
    bool isVisible = false;

    Widget registerTextHeader() {
      return Padding(
        padding: EdgeInsets.only(top: height * 0.06, bottom: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.secondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1, top: 2),
              child: Text(
                "Login to your account now",
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
    Widget buttonSubmit() {
      return Padding(
        padding: EdgeInsets.only(top: height * 0.04),
        child: CustomButton(
          title: "Login",
          onPressed: () {},
        ),
      );
    }

    Widget textButton() => Padding(
          padding: const EdgeInsets.only(bottom: 35),
          child: CustomTextButton(
            title: "Don't have an account? ",
            textBtn: "Sign Up here",
            onTap: () {
              router.pushNamed('register');
            },
          ),
        );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              registerTextHeader(),
              emailInput(),
              passwordInput(),
              buttonSubmit(),
              const Spacer(),
              textButton(),
            ],
          ),
        ),
      ),
    );
  }
}
