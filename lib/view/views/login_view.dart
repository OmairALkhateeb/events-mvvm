import 'package:events_mvc/const/app_colore.dart';
import 'package:events_mvc/const/app_textstyle.dart';
import 'package:events_mvc/repository/login_repository.dart';
import 'package:events_mvc/view/components/auth_button.dart';
import 'package:events_mvc/view/components/text_field.dart';
import 'package:events_mvc/view/views/register_view.dart';
import 'package:events_mvc/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  final LoginViewModel viewModel =
      LoginViewModel(loginRepository: LoginRepository());
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responseve code
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // wiget for scrolling
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.light,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: Column(
                  children: [
                    // widget for welcome message
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
                            end: Alignment.bottomRight),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(viewModel.title,
                                      style: AppTextStyle.authTitle()),
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

                    // widget for textfield

                    Container(
                      width: double.infinity,
                      height: screenHeight * 0.7,
                      decoration: BoxDecoration(color: AppColor.light),
                      child: Center(
                        child: SizedBox(
                          width: screenWidth * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeight * 0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MyTextField(
                                      controller:
                                          viewModel.emailController,
                                      label: 'Email',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MyTextField(
                                      controller:
                                          viewModel.passwordController,
                                      label: 'Password',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                    //widget for sign in
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: SizedBox(
                                          height: screenHeight * 0.05,
                                          width: 200,
                                          child: CustomButton(
                                            onPressed: () {
                                              viewModel.login();
                                            },
                                            title: 'Sign in',
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.15,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Expanded(
                                          child: Divider(
                                            thickness: 0.8,
                                            color: Color.fromRGBO(
                                                189, 189, 189, 1),
                                          ),
                                        ),
                                        Text(
                                          viewModel.creatAcount,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  104, 104, 104, 1),
                                              fontSize: 14),
                                        ),
                                        const Expanded(
                                          child: Divider(
                                            thickness: 0.5,
                                            color: Color.fromRGBO(
                                                189, 189, 189, 1),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // widget for creating  new account
                                    TextButton(
                                      onPressed: () {
                                        Get.to(RegisterScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Text(
                                          viewModel.registerButton,
                                          style: const TextStyle(
                                            color: Color(0xffba3521),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
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
    );
  }
}
