import 'package:final_assignment/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.controller,  this.icon, required this.label, this.keyboardType, this.inputFormatters, this.validator,this.readOnly = false,this.isPassword=false});
  final TextEditingController controller;
  final IconData? icon;
  final String label;
  final TextInputType? keyboardType;
   final   List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
     final bool readOnly;
     final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool  obscureText=true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      obscureText: widget.isPassword && obscureText,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword ? IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility,color:AppTheme.getApplicationTheme(false).colorScheme.primary),
          onPressed: (){
            setState(() {
              obscureText = !obscureText;
            });
          },
        ) : null,
        prefixIcon: Icon(widget.icon, color: const Color.fromRGBO(25, 118, 210, 1)),
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blue.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blue.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
        ),
        filled: true,
        fillColor: Colors.blue.shade50,
      ),
      validator: widget.validator,
    );
  }
}


