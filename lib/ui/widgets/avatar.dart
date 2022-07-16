import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;

  const Avatar({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ClipRect(
          child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(70),
          // image: DecorationImage(
          //   image: contact.img != null
          //       ? FileImage(File(contact.img!))
          //       : const AssetImage('assets/images/person.png')
          //           as ImageProvider,
          // ),
        ),
      )),
    );
  }
}
