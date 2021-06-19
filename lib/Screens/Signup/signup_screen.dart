import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/components.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/widgets/rounded_input_field.dart';
import 'package:flutter_auth/cubit/register_cubit/cubit.dart';
import 'package:flutter_auth/cubit/register_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size size2 = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            showToast(
                text: 'User Created Successfully . ', color: kPrimaryColor);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginScreen()));
            print('Register successed');
          }
          if (state is RegisterErrorState) {
            showToast(text: 'Try Another Email or Name !', color: kErrorColor);

            print('Register error ${state.error}');
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              height: size2.height,
              width: double.infinity,
              // Here i can use size.width but use double.infinity because both work as a same
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/signup_top.png",
                      width: size2.width * 0.35,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/main_bottom.png",
                      width: size2.width * 0.25,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "SIGNUP",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: size.height * 0.01),
                          SvgPicture.asset(
                            "assets/icons/signup.svg",
                            height: size.height * 0.23,
                          ),
                          RoundedFormInputField(
                            hintText: "Your name",
                            controller: nameController,
                            type: TextInputType.name,
                            icon: Icons.person,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'please enter your name';
                              }
                            },
                          ),
                          RoundedFormInputField(
                              icon: Icons.email,
                              hintText: "Your Email",
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'please enter your email';
                                }
                              }),
                          RoundedFormInputField(
                              hintText: 'password',
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              icon: Icons.lock,
                              isPassword:RegisterCubit.get(context) .isPassword,
                              suffix: RegisterCubit.get(context).suffix,
                              suffixPressed: () {
                                RegisterCubit.get(context)
                                    .changePassWordVisibilaty();
                              },
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'password is to short';
                                }
                              }),
                          ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => RoundedButton(
                              text: "SIGNUP",
                              press: () {
                                if (formKey.currentState.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      user_name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                            ),
                            fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          AlreadyHaveAnAccountCheck(
                            login: false,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginScreen();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
