import 'package:contacts/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';
// import 'contactbook.dart';
import 'contact.dart';

class NewContactView extends ConsumerStatefulWidget {
  const NewContactView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewContactViewState();
}

class _NewContactViewState extends ConsumerState<NewContactView> {
  late final TextEditingController _controller;
  late final TextEditingController _phoneController;
  @override
  void initState() {
    _controller = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void buttonAction(BuildContext context) {
    if (_controller.text.isNotEmpty && _phoneController.text.isNotEmpty) {
      final contact =
          Contact(name: _controller.text, phoneNumber: _phoneController.text);

      ref.read(contactProvider.notifier).addContact(newContact: contact);
      
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onEditingComplete: () => buttonAction(context),
              controller: _controller,
              decoration: const InputDecoration(
                label: Text('Enter contact name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              onEditingComplete: () => buttonAction(context),
              controller: _phoneController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Enter contact number'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            /*
            TextButton(
              onPressed: () => buttonAction(),
              child: const Text('Add Contact'),
            ),
            IconButton(
              onPressed: () => buttonAction(),
              icon: const Icon(Icons.group_add),
              label: Text('Add contact'),
            ),
            */
            const SizedBox(height: 20,),
            OutlinedButton.icon(
              onPressed: () => buttonAction(context),
              icon: const Icon(Icons.group_add),
              label: const Text('Add Contact'),
            )
          ],
        ),
      ),
    );
  }
}
