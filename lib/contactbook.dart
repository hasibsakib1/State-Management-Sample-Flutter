
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'contact.dart';


class ContactBook extends StateNotifier<List<Contact>> {
  ContactBook():super([]);

  void addContact({required Contact newContact}) {
    state.add(newContact);
    print(newContact.name);
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