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
    // List contacts = contactsList as List;
    var listView= ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return Padding(
              padding: const EdgeInsets.only(top:5, bottom: 5, right:10,left:10),
              child: Dismissible(
                key: ValueKey(contact.id),
                onDismissed: (direction) =>
                    contactUpdater.removeContact(contact: contact),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  color:const Color.fromARGB(255, 255, 255, 255),
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

    return  Scaffold(
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