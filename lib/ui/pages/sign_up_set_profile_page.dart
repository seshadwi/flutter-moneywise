import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moneywise_app/shared/shared_methods.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/pages/sign_up_set_ktp_page.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';

import '../../models/signup_form_model.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetProfilePage({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    'Upload Photo',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomFormField(
                    title: 'Set PIN (6 digit number)',
                    obscureText: true,
                    controller: pinController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 30),
                  CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {
                      if (validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpSetKtpPage(
                              data: widget.data.copyWith(
                                pin: pinController.text,
                                profilePicture: selectedImage == null
                                    ? null
                                    : 'data:image/png;base64,' +
                                        base64Encode(
                                          File(selectedImage!.path)
                                              .readAsBytesSync(),
                                        ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        showCustomSnackbar(context, 'PIN harus 6 digit');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
