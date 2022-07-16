import 'package:contact_book/helpers/contact_helpers.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final Contact? contact;
  final String type;
  const InputText({Key? key, this.contact, required this.type})
      : super(key: key);

  _keyboardType() {
    switch (type) {
      case 'name':
        return TextInputType.name;
      case 'email':
        return TextInputType.emailAddress;
      case 'phone':
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        keyboardType: _keyboardType(),
        decoration: InputDecoration(hintText: type),
      ),
    );
  }
}
