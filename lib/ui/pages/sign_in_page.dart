import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneywise_app/models/signin_form_model.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../shared/shared_methods.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Container(
                  height: 49,
                  width: 191,
                  margin: const EdgeInsets.only(
                    top: 65,
                    bottom: 100,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img_logo_light_mw.png'),
                    ),
                  ),
                ),
                Text(
                  'Sign in &\nGrow Your Finance',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NOTE: EMAIL INPUT
                      CustomFormField(
                        title: 'Email Address',
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),
                      // NOTE: PASSWORD INPUT
                      CustomFormField(
                        title: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password',
                          style: blueTextStyle,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomFilledButton(
                        title: 'Sign In',
                        onPressed: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(
                                  AuthLogin(
                                    SignInFormModel(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                          } else {
                            showCustomSnackbar(
                                context, 'Semua field harus diisi');
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextButton(
                  title: 'Create New Account',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-up', (route) => false);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
