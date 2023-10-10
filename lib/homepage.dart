import 'package:contacts/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';
import 'newcontactview.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    final contacts = ref.watch(contactProvider);
    final contactUpdater= ref.watch(contactProvider.notifier);


    return  Scaffold(
      appBar: AppBar(
        title: const Text('ContactBook'),
        leading: const Icon(Icons.contacts_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.phoneNumber),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Remove the contact when the delete button is pressed
              setState(() {
                contactUpdater.removeContact(contact: contact);
              });
            },
          ),
        );
        },
            )
      ),
      bottomSheet: InkWell(
        child: Container(
          color: Colors.blue,
          child: Text('Button'),
        ),
        onTap: () => print("hello ${contacts.last.name}"),
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