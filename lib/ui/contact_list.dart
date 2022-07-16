import 'package:contact_book/helpers/contact_helpers.dart';
import 'package:contact_book/ui/contact_item.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = [];

//carregar lista de contatos ao carregar a tela
  @override
  void initState() {
    super.initState();

    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list as List<Contact>;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          Contact contact = contacts[index];
          return ContactItem(contact);
        });
  }
}
