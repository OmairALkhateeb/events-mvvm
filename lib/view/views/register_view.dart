import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/const/app_textstyle.dart';
import 'package:events_mvc/repository/register_repository.dart';
import 'package:events_mvc/view/components/auth_button.dart';
import 'package:events_mvc/view/components/text_field.dart';
import 'package:events_mvc/view_model/register_view_model.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterViewModel viewModel = RegisterViewModel(registerRepository: RegisterRepository());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: Column(
                children: [
                  // Welcome message widget
                  Container(
                    height: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.pink,
                          AppColor.darkPink,
                          AppColor.morePink,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  viewModel.title,
                                  style: AppTextStyle.authTitle(),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              viewModel.welcome,
                              style: AppTextStyle.welcomeMessage(),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Text fields for user input
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.7,
                    color: AppColor.light,
                    child: Center(
                      child: SizedBox(
                        width: screenWidth * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Column(
                                children: [
                                  MyTextField(
                                    label: 'Name',
                                    controller: viewModel.nameController,
                                  ),
                                  const SizedBox(height: 10),
                                  MyTextField(
                                    label: 'Number',
                                    controller: viewModel.numberController,
                                  ),
                                  const SizedBox(height: 10),
                                  MyTextField(
                                    label: 'Email',
                                    controller: viewModel.emailController,
                                  ),
                                  const SizedBox(height: 10),
                                  MyTextField(
                                    label: 'Password',
                                    controller: viewModel.passwordController,
                                  ),
                                  const SizedBox(height: 10),
                                  MyTextField(
                                    label: 'Confirm password',
                                    controller: viewModel.conPasswordController,
                                  ),
                                  const SizedBox(height: 30),

                                  // Sign up button
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25),
                                    child: SizedBox(
                                      height: screenHeight * 0.05,
                                      width: 200,
                                      child: CustomButton(
                                        onPressed: () {
                                          viewModel.register();
                                        },
                                        title: 'Sign in',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
