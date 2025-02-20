import 'package:flutter/material.dart';
import 'package:profile/features/auth/presentation/manager/sign_up_view_model.dart';
import 'package:profile/features/auth/presentation/pages/recipe_date_of_birth_field.dart';
import 'package:profile/features/auth/presentation/widgets/recipe_text_form_field.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Sign Up"),
        ),
        body: ListView(
          children: [
            SizedBox(height: 100),
            RecipeTextFormField(
              title: "First Name",
              hintText: "Abdulloh",
              validator: (value) => null,
              controller: context.read<SignUpViewModel>().firstNameController,
            ),
            SizedBox(height: 10),
            RecipeTextFormField(
              title: "Last Name",
              hintText: "Abdurahmonov",
              validator: (value) => null,
              controller: context.read<SignUpViewModel>().lastNameController,
            ),
            SizedBox(height: 10),
            RecipeTextFormField(
              title: "Email",
              hintText: "example@example.com",
              validator: (value) => null,
              controller: context.read<SignUpViewModel>().emailController,
            ),
            SizedBox(height: 10),
            RecipeDateOfBirthField(),
          ],
        ),
      ),
    );
  }
}
