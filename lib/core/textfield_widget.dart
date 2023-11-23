import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final controller;
  final String labeltext;
  final IconData? icon;
  const Mytextfield(
      {super.key, this.controller, required this.labeltext, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 50,
        width: 350,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
          cursorColor: Colors.black,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: labeltext,
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(icon)),
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black),
              ),
              fillColor: Colors.white),
        ),
      ),
    );
  }
}
