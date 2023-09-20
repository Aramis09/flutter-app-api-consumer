import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Map<String, dynamic> _dataMenu = {
  "titles": ["Change theme"],
  "iconsTitles": [Icons.style],
  "redirectsTo": ["/settings/themeOptions"]
};

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> titles = _dataMenu["titles"];
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Configuracion",
                  style:
                      TextStyle(fontSize: 35, color: colors.onInverseSurface),
                ),
                const SizedBox(
                  height: 30,
                ),
                ...titles.map((value) => _TitleCustom(
                    colors: colors,
                    routeToRedirect: _dataMenu["redirectsTo"]
                        [titles.indexOf(value)],
                    value: value,
                    iconTitle: _dataMenu["iconsTitles"][titles.indexOf(value)]))
              ])),
    );
  }
}

class _TitleCustom extends StatelessWidget {
  final String value;
  final String routeToRedirect;
  final IconData iconTitle;
  final ColorScheme colors;
  const _TitleCustom(
      {required this.value,
      required this.routeToRedirect,
      required this.iconTitle,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          title: Text(
            value,
            style: TextStyle(color: colors.onInverseSurface),
          ),
          leading: Icon(
            iconTitle,
            color: colors.onInverseSurface,
          ),
          onTap: () {
            context.go(routeToRedirect);
            context.pop();
            //!es importante no poner navigation, sino se pierde todo el hisotrial de rutas
          },
        ),
      ),
    );
  }
}
