import 'package:uuid/uuid.dart';

class Contact {
  final String name;
  final String phoneNumber;
  final String id;
  Contact({required this.name, required this.phoneNumber}) : id = const Uuid().v4();

  @override
  String toString() {
    String contact = 'Contatct(Name: $name, Phone: $phoneNumber)';
    return contact;
  }
}


