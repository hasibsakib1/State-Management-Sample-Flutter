
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'contact.dart';


class ContactBook extends StateNotifier<List<Contact>> {
  ContactBook._sharedInstance():super([]);
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  void addContact({required Contact newContact}) {
    state.add(newContact);
    // notifyListeners();
  }

  void removeContact({required Contact contact}) {
    if(state.contains(contact)){
      state.remove(contact);
      // notifyListeners();
    }
  }

  Contact? contact({required int atIndex})=> state.length>atIndex? state[atIndex]: null;
}