import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? colorText;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? background;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    this.text,
    this.colorText,
    this.height,
    this.width,
    this.padding,
    this.background,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: MaterialButton(
          color: background ?? const Color(0x920E9E09),
          height: height ?? 50,
          minWidth: width ?? double.infinity,
          onPressed: onPressed ?? () {},
          child: Text(
            text ?? "Click",
            style: TextStyle(color: colorText ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
