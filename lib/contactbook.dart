
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'contact.dart';


class ContactBook extends StateNotifier<List<Contact>> {
  ContactBook():super([]);

  void addContact({required Contact newContact}) {
    state= [...state,newContact];
  }

  void removeContact({required Contact contact}) {
    if(state.contains(contact)){
      state = state.where((element) => element.id != contact.id).toList();
    }
  }

  Contact? contact({required int atIndex})=> state.length>atIndex? state[atIndex]: null;
}