import 'package:flutter/material.dart';

import '../../../../core/style/general_styles.dart';

class PasswordTextFieldCard extends StatefulWidget {

  final String text;
  final TextEditingController controller;
  final bool isObrigatory;

  const PasswordTextFieldCard({
    required this.text,
    required this.controller,
    this.isObrigatory = false,
    super.key
  });

  @override
  State<PasswordTextFieldCard> createState() => _PasswordTextFieldCard();
}

class _PasswordTextFieldCard extends State<PasswordTextFieldCard> {

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(
            color: GeneralStyle.themeMainColor,
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.text),
              const SizedBox(width: 5),
              Visibility(
                visible: widget.isObrigatory,
                child: const Text(
                  '*',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                ),
              ),
            ],
          ),
          prefixIcon: const Icon(
            Icons.lock,
            color: GeneralStyle.themeMainColor,
          ),
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: GeneralStyle.themeMainColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: GeneralStyle.themeInversedBackgroundColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: GeneralStyle.themeMainColor,
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: GeneralStyle.themeLayer0BackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
