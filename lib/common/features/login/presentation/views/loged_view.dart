import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/common/features/login/bloc/login_bloc.dart';
import 'package:flutter_aplication_bloc/common/shared/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogedView extends StatelessWidget {
  const LogedView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Quieres Cerrar Sesion? ",
            style: TextStyle(color: colors.onInverseSurface, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: "Cerrar Sesion",
            background: colors.primary,
            onPressed: () => context.read<LoginBloc>().add(SignOffAccount()),
          )
        ],
      ),
    );
  }
}
