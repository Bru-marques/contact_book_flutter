import 'package:contact_book/helpers/contact_helpers.dart';
import 'package:contact_book/ui/contact_list.dart';
import 'package:contact_book/ui/contact_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  final List<Tab> myTab = <Tab>[
    const Tab(text: 'Contacts'),
    const Tab(text: 'Groups')
  ];

//  Color(0xffe8708e)
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                tabs: myTab,
                labelColor: Colors.black54,
                indicatorColor: Color(0xffe8708e),
              ),
              centerTitle: false,
              backgroundColor: const Color(0xffeaedf0),
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.person_add,
                      color: Color.fromARGB(255, 223, 59, 100)),
                  onPressed: () => _showContactPage(),
                )
              ],
              title: const Text('Contact',
                  style: TextStyle(color: Colors.black87))),
          body: _body()),
    );
  }

  _body() {
    return TabBarView(
        children: myTab.map((Tab tab) {
      final String label = tab.text!.toLowerCase();
      return const Center(child: ContactList());
    }).toList());
  }

  void _showContactPage() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ContactPage()));
  }
}
