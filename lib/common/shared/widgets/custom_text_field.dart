import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? placeHolder;
  final IconData? iconPlaceHolder;
  final double? moveVerticallyText;
  final Color? generalTheme;
  final bool? hidenText;
  final EdgeInsetsGeometry? margin;
  final void Function(String)? onChanged;
  final Color? background;
  final double? height;
  CustomTextField(
      {super.key,
      this.placeHolder,
      this.iconPlaceHolder,
      this.generalTheme,
      this.hidenText,
      this.onChanged,
      this.margin,
      this.height,
      this.moveVerticallyText,
      this.background});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

//! ---state------state------state------state------state------state---
class _CustomTextFieldState extends State<CustomTextField> {
  bool onFocus = false;
  @override
  Widget build(BuildContext context) {
    final generalTheme = widget.generalTheme;
    void onTapCustom() {
      // FocusScope.of(context).unfocus();

      setState(() {});
    }

    return Container(
        height: widget.height ?? 40,
        decoration: _Helpers().switchStylesBoxDecoration(
            onFocus, generalTheme, widget.background),
        alignment: Alignment.center,
        margin: widget.margin,
        child: Row(
          children: [
            _Helpers().textFieldCustom(
                placeHolder: widget.placeHolder,
                onTap: onTapCustom,
                hidenText: widget.hidenText,
                onChange: widget.onChanged,
                moveVerticallyText: widget.moveVerticallyText), //!aqui
            _Helpers().iconPlaceHolder(widget.iconPlaceHolder, generalTheme)
          ],
        ));
  }
}

//! --------------logic--------------------------logic--------------------------logic--------------------------
class _Helpers {
  BoxDecoration switchStylesBoxDecoration(
      bool focus, Color? generalTheme, Color? background) {
    if (focus) {
      final boxDecoretionFocus = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: generalTheme ?? const Color(0x920E9E09), // Color del borde
          width: 2.0,
        ),
      );
      return boxDecoretionFocus;
    }

    final boxDecoretionOutFocus = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: background ?? const Color.fromARGB(255, 230, 230, 230),
    );
    return boxDecoretionOutFocus;
  }

  Padding iconPlaceHolder(IconData? iconIn, Color? generalTheme) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Icon(
        iconIn ?? Icons.question_mark,
        color: generalTheme ?? const Color(0xFFB1B1B1),
      ),
    );
  }

  Expanded textFieldCustom(
      {String? placeHolder,
      void onTap()?,
      bool? hidenText,
      double? moveVerticallyText,
      void Function(String)? onChange}) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: moveVerticallyText ?? 5),
      child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextFormField(
            onChanged: onChange,
            obscureText: hidenText ?? false,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeHolder ?? "",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                )),
            onTap: onTap ?? () {},
          )),
    ));
  }
}
