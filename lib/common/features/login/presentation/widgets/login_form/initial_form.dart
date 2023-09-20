import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/client/features/theme/production/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/widgets/custom_text_field.dart';
import '../../../bloc/login_bloc.dart';

class FormLogin extends StatelessWidget {
  final BuildContext context;
  const FormLogin({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loginBloc = context.read<LoginBloc>();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
          child: Column(
        children: [
          CustomTextField(
            iconPlaceHolder: Icons.email_outlined,
            placeHolder: "Direccion de Correo",
            generalTheme: colors.primary,
            onChanged: (value) => loginBloc.add(OnChangeUser(user: value)),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            iconPlaceHolder: Icons.password_outlined,
            placeHolder: "Contraseña",
            generalTheme: colors.primary,
            hidenText: true,
            onChanged: (value) =>
                loginBloc.add(OnChangePassword(password: value)),
          )
        ],
      )),
    );
  }
}
