import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/client/features/theme/production/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemesOptionsView extends StatelessWidget {
  const ThemesOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.colorList.length,
            itemBuilder: (context, index) => Container(
                height: 150,
                child: MaterialButton(
                    color: state.colorList[index],
                    onPressed: () =>
                        context.read<ThemeCubit>().changeColor(index),
                    child: Text(
                      state.colorList[0].toString(),
                    ))),
          )),
    );
  }
}
