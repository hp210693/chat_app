import 'package:flutter/material.dart';

class TextInputBase extends StatefulWidget {
  TextInputBase(this._labelName, this._labelNameHint, this._color,
      this._fontFamily, this._fontSize, this._fontWeight);

  @override
  State<TextInputBase> createState() => _TextInputBaseState(
      this._labelName,
      this._labelNameHint,
      this._color,
      this._fontFamily,
      this._fontSize,
      this._fontWeight);
  final String _labelName;
  final String _labelNameHint;
  final String _color;
  final String _fontFamily;
  final String _fontSize;
  final String _fontWeight;
}

class _TextInputBaseState extends State<TextInputBase> {
  ///
  _TextInputBaseState(this._labelName, this._labelNameHint, this._color,
      this._fontFamily, this._fontSize, this._fontWeight) {
    this._controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this._controller,
      autofocus: true,
      onChanged: (text) {
        this._controller.text.length > 0
            ? this.setState(() {
                this._showClearButton = true;
              })
            : this.setState(() {
                this._showClearButton = false;
              });
      },

      ///
      decoration: InputDecoration(
        labelText: this._labelName,
        labelStyle:
            TextStyle(color: Color(int.parse(this._color)), fontSize: 14),
        filled: true,
        suffixIcon: this._showClearButton == true
            ? IconButton(
                onPressed: () => {
                  this._controller.clear(),
                  this.setState(() {
                    this._showClearButton = false;
                  })
                },
                icon: Icon(Icons.clear),
              )
            : null,

        /// When press on text form filed
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black54, width: 0.5),
        ),

        /// When not press on text form filed
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.black45,
            width: 0.5,
          ),
        ),
      ),

      /// Validation when user can't input
      validator: (value) {
        if (value.isEmpty) {
          return _labelNameHint + _labelName;
        }
        return null;
      },
    );
  }

  final String _labelName;
  final String _labelNameHint;
  final String _color;
  final String _fontFamily;
  final String _fontSize;
  final String _fontWeight;
  bool _showClearButton = false;
  TextEditingController _controller;
}
