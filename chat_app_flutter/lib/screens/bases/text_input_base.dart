import 'package:flutter/material.dart';

class TextInputBase extends StatefulWidget {
  final String _labelName;

  TextInputBase(this._labelName);

  @override
  State<TextInputBase> createState() => _TextInputBaseState(this._labelName);
}

class _TextInputBaseState extends State<TextInputBase> {
  final String _labelName;
  bool _showClearButton = false;
  TextEditingController _controller;

  _TextInputBaseState(this._labelName) {
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
      //
      decoration: InputDecoration(
        labelText: _labelName,
        labelStyle: TextStyle(color: Colors.black, fontSize: 14),
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
        // When press on text form filed
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black54, width: 0.5),
        ),
        // When not press on text form filed
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.black45,
            width: 0.5,
          ),
        ),
      ),
      //
      validator: (value) {
        if (value.isEmpty) {
          return "Please input your " + _labelName;
        }
        return null;
      },
    );
  }
}
