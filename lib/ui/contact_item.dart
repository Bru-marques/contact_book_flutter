import 'dart:io';

import 'package:contact_book/helpers/contact_helpers.dart';
import 'package:contact_book/ui/contact_page.dart';
import 'package:contact_book/ui/widgets/avatar.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatefulWidget {
  final Contact contact;
  const ContactItem(this.contact, {Key? key}) : super(key: key);

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  ContactHelper helper = ContactHelper();
  Contact get contact => widget.contact;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showContactPage(contact: contact),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Card(
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                const Avatar(size: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.name!,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        contact.phone!,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showContactPage({Contact? contact}) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactPage(contact: contact)));
    if (contact != null) {
      await helper.updateContact(contact);
    }
  }
}
