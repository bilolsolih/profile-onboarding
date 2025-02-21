import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile/core/core.dart';
import 'package:profile/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:profile/features/auth/presentation/manager/sign_up_view_model.dart';
import 'package:profile/features/auth/presentation/widgets/recipe_date_of_birth_field.dart';
import 'package:profile/features/auth/presentation/widgets/recipe_password_form_field.dart';
import 'package:profile/features/auth/presentation/widgets/recipe_text_form_field.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(
        authRepo: context.read(),
      ),
      builder: (context, child) {
        final vm = context.read<SignUpViewModel>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Sign Up"),
          ),
          body: ListView(
            children: [
              SizedBox(height: 20),
              Form(
                key: vm.formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    RecipeTextFormField(
                      title: "First Name",
                      hintText: "Abdulloh",
                      validator: (value) => null,
                      controller: vm.firstNameController,
                    ),
                    RecipeTextFormField(
                      title: "Last Name",
                      hintText: "Abdurahmonov",
                      validator: (value) => null,
                      controller: vm.lastNameController,
                    ),
                    RecipeTextFormField(
                      title: "Username",
                      hintText: "chef-solih",
                      validator: (value) => null,
                      controller: vm.usernameController,
                    ),
                    RecipeTextFormField(
                      title: "Email",
                      hintText: "example@example.com",
                      validator: (value) => null,
                      controller: vm.emailController,
                    ),
                    RecipeTextFormField(
                      title: "Phone Number",
                      hintText: "+998901234567",
                      validator: (value) => null,
                      controller: vm.numberController,
                    ),
                    RecipeDateOfBirthField(),
                    RecipePasswordFormField(
                      controller: vm.passwordController,
                      title: "Password",
                      validator: (value) => null,
                    ),
                    RecipePasswordFormField(
                      controller: vm.confirmPasswordController,
                      title: "Confirm Password",
                      validator: (value) {
                        if (vm.passwordController.text != vm.confirmPasswordController.text) {
                          return "Passwords do not match!";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              RecipeElevatedButton(
                text: "Sign Up",
                size: Size(195, 45),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.redPinkMain,
                callback: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.white,
                      child: Container(
                        width: 250,
                        height: 286,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.padding36,
                          vertical: 24,
                        ),
                        child: Column(
                          spacing: 9,
                          children: [
                            SizedBox(
                              width: 133,
                              height: 44,
                              child: Text(
                                "Sign Up Successful!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.beigeColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            Container(
                              width: 82,
                              height: 82,
                              decoration: BoxDecoration(
                                color: AppColors.pink,
                                borderRadius: BorderRadius.circular(41),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/profile.svg",
                                  width: 30,
                                  height: 45,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.redPinkMain,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.beigeColor,
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                  // if (vm.formKey.currentState!.validate()) {
                  //   if (await vm.signUp() && context.mounted) {
                  //     await showDialog(
                  //       context: context,
                  //       builder: (context) => Material(
                  //         child: Center(
                  //           child: Container(
                  //             width: 250,
                  //             height: 286,
                  //             decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               borderRadius: BorderRadius.circular(40),
                  //             ),
                  //             child: Column(
                  //               children: [
                  //                 Text("Sign Up Successful!"),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   }
                  // }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
