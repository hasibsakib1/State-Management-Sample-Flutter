import 'package:contacts/contact.dart';
import 'package:contacts/contactbook.dart';
import 'package:contacts/newcontactview.dart';
import 'package:flutter/material.dart';

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
                return Dismissible(
                  key: ValueKey(contact.id),
                  onDismissed: (direction) => contactBook.removeContact(contact: contact) ,
                  child: Material(
                    elevation: 5,
                    color: Color.fromARGB(255, 221, 218, 218),
                    child: ListTile(
                      title: Text(contact.name),
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: contactBook.length!=0 ? listView: Center(child: Text("OOPS... You have no contacts.")) ,
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
