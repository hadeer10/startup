import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Archive/background.dart';
import 'package:flutter_auth/components/alert_dialog.dart';
import 'package:flutter_auth/components/components.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/cubit/create_post_cubit/cubit.dart';
import 'package:flutter_auth/cubit/create_post_cubit/states.dart';
import 'package:flutter_auth/modeproviderr.dart';
import 'package:flutter_auth/widgets/rounded_input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AddStartUpScreen2 extends StatelessWidget {
  static String id = 'AddStartUpScreen2';
  var formKey = GlobalKey<FormState>();
  var fundingTotalUsedController = TextEditingController();
  var countryCodeController = TextEditingController();
  var fundingRoundsController = TextEditingController();
  var categoryListController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //this is id of post just created :used to complete post creation
    int id = CreatePostCubit.get(context).post1model.id;
    print('id is : $id');
    Size size = MediaQuery.of(context).size;
    var white = Provider.of<Myproiderr>(context).white;
    var back = Provider.of<Myproiderr>(context).appbarcolor;

    return BlocConsumer<CreatePostCubit, CreatePostStates>(
        listener: (context, state) {
      if (state is CreatePostPart2SuccessState) {
        String score = state.post2model.score.toString();
        print('post2 created successfully with score : $score');

        showAlertDialog(context, back, white, score);
      }

      if (state is CreatePostPart2ErrorState) {
        print('error create post 2');
        print('error is : ${state.error}');
        showToast(
            text: 'some thing wrong .. try again ! .', color: kErrorColor);
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Background(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Add Start Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Provider.of<Myproiderr>(context).white,
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),
                  RoundedFormInputField(
                      controller: fundingTotalUsedController,
                      hintText: 'Total Funding',
                      icon: Icons.monetization_on_outlined,
                      type: TextInputType.number,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'total funding must not be empty !';
                        }
                      }),
                  RoundedFormInputField(
                      controller: countryCodeController,
                      hintText: 'Country Code',
                      icon: Icons.qr_code_2_outlined,
                      type: TextInputType.text,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Country Code must not be empty !';
                        }
                      }),
                  RoundedFormInputField(
                      controller: fundingRoundsController,
                      hintText: 'Funding Rounds',
                      icon: Icons.money,
                      type: TextInputType.number,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Funding Round must not be empty !';
                        }
                      }),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: DropdownButtonFormField<String>(
                        validator: (String value) {
                          if (value == null) {
                            return 'Category must not be empty !';
                          }
                          return null;
                        },
                        hint: Text('Select Category '),
                        value: CreatePostCubit.get(context).selectedValue,
                        onChanged: (String value) =>
                            CreatePostCubit.get(context)
                                .changeSelectedMenuItem(value),
                        items: categoryList.map((String stringItemValue) {
                          return DropdownMenuItem<String>(
                              value: stringItemValue,
                              child: Text(stringItemValue));
                        }).toList()),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: RoundedButton(
                        text: "Result",
                        press: () {
                          // send create post part 2 and get final result and score
                          if (formKey.currentState.validate()) {
                          
                            CreatePostCubit.get(context).createPost2(
                                funding_total_usd:
                                    int.parse(fundingTotalUsedController.text),
                                country_code: countryCodeController.text,
                                funding_rounds:
                                    int.parse(fundingRoundsController.text),
                                category_list:
                                    CreatePostCubit.get(context).selectedValue,
                                id: id);
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
