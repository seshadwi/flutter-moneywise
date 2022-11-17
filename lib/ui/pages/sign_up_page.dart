import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneywise_app/blocs/auth/auth_bloc.dart';
import 'package:moneywise_app/models/signup_form_model.dart';
import 'package:moneywise_app/shared/shared_methods.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/pages/sign_up_set_profile_page.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';

import '../widgets/buttons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // CREATE CONTROLLER
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool valiate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
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
            debugPrint(state.e);
          }

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpSetProfilePage(
                  data: SignUpFormModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                ),
              ),
            );
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
                  'Join Us to Unlock\nYour Growth',
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
                      CustomFormField(
                        title: 'Full Name',
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        title: 'Email Address',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        title: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomFilledButton(
                        title: 'Continue',
                        onPressed: () {
                          if (valiate()) {
                            context
                                .read<AuthBloc>()
                                .add(AuthCheckEmail(emailController.text));
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
                  title: 'Sign In',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-in');
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
