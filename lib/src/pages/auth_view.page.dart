import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddisney_plus/src/extensions/colors.extension.dart';

class AuthPageView extends StatelessWidget {

  final String title;
  final String placeholder;
  final TextInputType inputType;
  final ValueChanged<String> onValueChanged;
  final TextInputAction inputAction;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final FocusNode focusNode;
  final bool obscureText;
  
  const AuthPageView({
    Key key,
    this.title,
    this.placeholder,
    this.inputType,
    this.obscureText,
    this.onValueChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputAction,
    this.focusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                  child: Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24
                    )
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: CupertinoTextField(
                  autofocus: true,
                  obscureText: this.obscureText,
                  textInputAction: inputAction,
                  keyboardAppearance: Brightness.dark,
                  onChanged: onValueChanged,
                  onEditingComplete: this.onEditingComplete,
                  onSubmitted: this.onSubmitted,
                  keyboardType: this.inputType,
                  cursorWidth: 4,
                  focusNode: this.focusNode,
                  cursorColor: HexColor.fromHex("#332763"),
                  placeholder: this.placeholder,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 28
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                  placeholderStyle: TextStyle(
                    color: HexColor.fromHex("#777777"),
                    fontWeight: FontWeight.w700,
                    fontSize: 28
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }

}