import 'package:flutter/material.dart';

class CheckboxText extends StatefulWidget {
  String title;
  Color? checkColor;
  Color? colorText;
  CheckboxText(
      {super.key, required this.title, this.checkColor, this.colorText});

  @override
  State<CheckboxText> createState() => _CheckboxTextState();
}

class _CheckboxTextState extends State<CheckboxText> {
  bool _checkStatus = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _checkStatus,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        widget.title,
        style: TextStyle(
            color: widget.colorText ?? const Color(0xFF686868), fontSize: 15),
      ),
      onChanged: (value) {
        _checkStatus = !_checkStatus;
        setState(() {});
      },
      activeColor: widget.checkColor ?? const Color(0x920E9E09),
    );
  }
}
