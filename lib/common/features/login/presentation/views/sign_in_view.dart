import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/build_welcom.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';

class SingInView extends StatelessWidget {
  const SingInView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // const BuildWelcomeWidget(),
          const SizedBox(height: 10),
          _buildForm(colors),
          CustomButton(
            text: "Registrarse",
            height: 43,
            background: colors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          CustomButton(
            background: colors.primary,
            text: "Iniciar Sesion",
            height: 43,
            onPressed: () => context.go("/login"),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 13),
          )
          // _buildTextBackToLogin(context)
        ]);
  }

//!logic
  _buildForm(ColorScheme colors) {
    List<String> fields = [
      "Name",
      "Last Name",
      "Email",
      "Password",
      "Contact Number"
    ];
    List<IconData> iconsFields = [
      Icons.person_outlined,
      Icons.person_outlined,
      Icons.email_outlined,
      Icons.visibility_off,
      Icons.phone
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ...fields.map((value) => CustomTextField(
                placeHolder: value,
                margin: const EdgeInsets.only(bottom: 15),
                iconPlaceHolder: iconsFields[fields.indexOf(value)],
                height: 50,
                moveVerticallyText: 12,
                generalTheme: colors.primary,
                background: const Color.fromARGB(255, 217, 217, 217),
              ))
        ],
      ),
    );
  }

  _buildTextBackToLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        TextButton(
            onPressed: () => context.go("/login"),
            child: const Text(
              "Sign In",
              style: TextStyle(
                  color: Color(0x920E9E09), fontStyle: FontStyle.italic),
            ))
      ],
    );
  }
}
