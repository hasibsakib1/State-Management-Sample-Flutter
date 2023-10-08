import 'package:flutter/material.dart';

import 'package:contacts/contact.dart';
import 'package:contacts/contactbook.dart';
import 'package:contacts/newcontactview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactBook = ContactBook();

    var listView = ValueListenableBuilder(
      valueListenable: ContactBook(),
      builder: (BuildContext context, List<Contact> value, Widget? child) {
        return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            final contact = value[index];
            return Padding(
              padding: const EdgeInsets.only(top:5, bottom: 5, right:10,left:10),
              child: Dismissible(
                key: ValueKey(contact.id),
                onDismissed: (direction) =>
                    contactBook.removeContact(contact: contact),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 222, 182, 196),
                      ),
                      child: Center(
                        child: Text(
                          contact.name[0],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    title: Text(contact.name),
                    subtitle: Text(contact.phoneNumber),
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactBook'),
        leading: const Icon(Icons.contacts_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: listView,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewContactView()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
