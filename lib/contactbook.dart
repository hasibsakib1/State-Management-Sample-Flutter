//import 'package:flutter/material.dart';

import 'contact.dart';


class ContactBook {
  ContactBook._sharedInstance();
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  final List<Contact> _contacts = [];
  int get length => _contacts.length;

  void addContact({required Contact contact}) => _contacts.add(contact);

  void removeContact({required Contact contact}) => _contacts.remove(contact);

  Contact? contact({required int atIndex})=> _contacts.length>atIndex? _contacts[atIndex]: null;
}