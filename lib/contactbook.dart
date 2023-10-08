//import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'contact.dart';


class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance():super([]);
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  int get length => value.length;

  void addContact({required Contact newContact}) {
    value.add(newContact);
    notifyListeners();
  }

  void removeContact({required Contact contact}) {
    if(value.contains(contact)){
      value.remove(contact);
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex})=> value.length>atIndex? value[atIndex]: null;
}