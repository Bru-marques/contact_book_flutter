import 'package:contact_book/helpers/contact_helpers.dart';
import 'package:contact_book/ui/widgets/avatar.dart';
import 'package:contact_book/ui/widgets/input_text.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;
  const ContactPage({Key? key, this.contact}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late Contact _editedContact;

  @override
  void initState() {
    super.initState();

    // if (widget.contact == null) {
    //   _editedContact = Contact.fromMap(widget.contact!.toMap());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffeaedf0),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Color.fromARGB(255, 223, 59, 100)),
            onPressed: () => Navigator.pop(context),
          )),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Column(
        children: [
          _header(),
          const InputText(
            type: 'name',
          ),
          const InputText(
            type: 'phone',
          ),
          const InputText(
            type: 'email',
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 196, 58, 92),
                ),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Avatar(size: 140),
      const Text('nome',
          style: TextStyle(
            height: 1.5,
            fontSize: 26,
          )),
      const Text('fone',
          style: TextStyle(
            fontSize: 20,
          )),
      const Text('email',
          style: TextStyle(fontSize: 18, color: Colors.black54)),
      SizedBox(
        height: 100,
        width: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'call',
              backgroundColor: const Color(0xffe8708e),
              onPressed: () {},
              child: const Icon(
                Icons.call,
              ),
            ),
            FloatingActionButton(
              heroTag: 'text',
              backgroundColor: const Color(0xffe8708e),
              onPressed: () {},
              child: const Icon(Icons.message_rounded),
            ),
          ],
        ),
        // ),
      )
    ]);
  }
}
