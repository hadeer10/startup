import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/home.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/components.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/login_cubit/cubit.dart';
import 'package:flutter_auth/cubit/login_cubit/states.dart';
import 'package:flutter_auth/network/local/cache_helper.dart';
import 'package:flutter_auth/widgets/rounded_input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size size2 = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showToast(
                text: 'you Logged in Successfully .', color: kPrimaryColor);
            print(state.loginModel);
            CacheHelper.saveData(key: 'uId', value: state.loginModel.user_id)
                .then((value) {
              uId = state.loginModel.user_id;
              print(uId);
              print(state.loginModel.user_id);
            });
            CacheHelper.saveData(
                    key: 'access_token', value: state.loginModel.access)
                .then((value) {
              accessToken = state.loginModel.access;
              print(accessToken);
              print(state.loginModel.access);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            });
          }
          if (state is LoginErrorState) {
            showToast(
                text: 'Some thing wrong , try again !', color: kErrorColor);
            print(state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Container(
            width: double.infinity,
            height: size2.height,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_top.png",
                    width: size2.width * 0.35,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/login_bottom.png",
                    width: size2.width * 0.4,
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "LOGIN",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.03),
                        SvgPicture.asset(
                          "assets/icons/login.svg",
                          height: size.height * 0.35,
                        ),
                        SizedBox(height: size.height * 0.03),
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
                            isPassword: LoginCubit.get(context).isPassword,
                            suffix: LoginCubit.get(context).suffix,
                            suffixPressed: () {
                              LoginCubit.get(context)
                                  .changePassWordVisibilaty();
                            },
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'password is to short';
                              }
                            }),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => RoundedButton(
                            text: "LOGIN",
                            press: () {
                              if (formKey.currentState.validate()) {
                                LoginCubit.get(context).userLogin(
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
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
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
          ));
        },
      ),
    );
  }
}
