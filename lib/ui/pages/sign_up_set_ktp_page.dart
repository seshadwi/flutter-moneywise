import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moneywise_app/models/signup_form_model.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../shared/shared_methods.dart';

class SignUpSetKtpPage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetKtpPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpSetKtpPage> createState() => _SignUpSetKtpPageState();
}

class _SignUpSetKtpPageState extends State<SignUpSetKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
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
                  'Verify Your\nAccount',
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
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final image = await selectImage();
                          setState(() {
                            selectedImage = image;
                          });
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightBgColor,
                            image: selectedImage == null
                                ? null
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      File(selectedImage!.path),
                                    ),
                                  ),
                          ),
                          child: selectedImage != null
                              ? null
                              : Center(
                                  child: Image.asset(
                                    'assets/ic_upload.png',
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Passport/ID Card',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomFilledButton(
                        title: 'Continue',
                        onPressed: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(
                                  AuthRegister(
                                    widget.data.copyWith(
                                      ktp: selectedImage == null
                                          ? null
                                          : 'data:image/png;base64,' +
                                              base64Encode(
                                                File(selectedImage!.path)
                                                    .readAsBytesSync(),
                                              ),
                                    ),
                                  ),
                                );
                          } else {
                            showCustomSnackbar(
                                context, 'Gambar tidak boleh kosong');
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                CustomTextButton(
                  title: 'Skip for Now',
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthRegister(
                            widget.data,
                          ),
                        );
                    // Navigator.pushNamed(context, '/sign-up-success');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
